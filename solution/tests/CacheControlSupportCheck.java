import common.web.CacheControlSupport;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

public class CacheControlSupportCheck {

    public static void main(String[] args) {
        Map<String, String> headers = new HashMap<String, String>();
        long[] expires = new long[] {
            -1L
        };
        HttpServletResponse response = (HttpServletResponse) Proxy.newProxyInstance(
            HttpServletResponse.class.getClassLoader(),
            new Class<?>[] {
            HttpServletResponse.class
        },
            new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, java.lang.reflect.Method method, Object[] values) {
                if ("setHeader".equals(method.getName())) {
                    headers.put((String) values[0], (String) values[1]);
                } else if ("setDateHeader".equals(method.getName())) {
                    expires[0] = ((Long) values[1]).longValue();
                }
                return null;
            }
        });

        CacheControlSupport.preventCaching(response);
        if (!"no-store, no-cache, must-revalidate, private".equals(headers.get("Cache-Control"))) {
            throw new AssertionError("Private responses must not be stored in browser caches");
        }
        if (!"no-cache".equals(headers.get("Pragma")) || expires[0] != 0L) {
            throw new AssertionError("Legacy cache headers must also disable caching");
        }
        System.out.println("Private response cache header checks passed");
    }
}
