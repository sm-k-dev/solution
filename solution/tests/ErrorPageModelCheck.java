import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.web.ErrorPageModel;

public class ErrorPageModelCheck {

    public static void main(String[] args) {
        Map<String, Object> attributes = new HashMap<String, Object>();
        attributes.put("javax.servlet.error.status_code", Integer.valueOf(409));
        attributes.put("javax.servlet.error.request_uri", "/admin/members/status");
        final int[] responseStatus = new int[1];

        HttpServletRequest request = proxy(HttpServletRequest.class, (proxy, method, values) -> {
            if ("getAttribute".equals(method.getName())) {
                return attributes.get(values[0]);
            }
            if ("setAttribute".equals(method.getName())) {
                attributes.put((String) values[0], values[1]);
                return null;
            }
            if ("getRequestURI".equals(method.getName())) {
                return "/fallback";
            }
            return defaultValue(method.getReturnType());
        });
        HttpServletResponse response = proxy(HttpServletResponse.class, (proxy, method, values) -> {
            if ("setStatus".equals(method.getName())) {
                responseStatus[0] = ((Integer) values[0]).intValue();
            }
            return defaultValue(method.getReturnType());
        });

        ErrorPageModel.populate(request, response);
        if (responseStatus[0] != 409) {
            throw new AssertionError("Conflict page must preserve HTTP 409");
        }
        if (!Integer.valueOf(409).equals(attributes.get("errorStatus"))) {
            throw new AssertionError("Conflict status must be shown in the error page");
        }
        if (!"/admin/members/status".equals(attributes.get("errorUri"))) {
            throw new AssertionError("Original request URI must be retained");
        }
        System.out.println("Error page status checks passed");
    }

    private static <T> T proxy(Class<T> type, InvocationHandler handler) {
        Object value = Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[] {
            type
        }, handler);
        return type.cast(value);
    }

    private static Object defaultValue(Class<?> type) {
        if (!type.isPrimitive() || type == Void.TYPE) {
            return null;
        }
        if (type == Boolean.TYPE) {
            return Boolean.FALSE;
        }
        if (type == Character.TYPE) {
            return Character.valueOf('\0');
        }
        if (type == Byte.TYPE) {
            return Byte.valueOf((byte) 0);
        }
        if (type == Short.TYPE) {
            return Short.valueOf((short) 0);
        }
        if (type == Integer.TYPE) {
            return Integer.valueOf(0);
        }
        if (type == Long.TYPE) {
            return Long.valueOf(0L);
        }
        if (type == Float.TYPE) {
            return Float.valueOf(0F);
        }
        return Double.valueOf(0D);
    }
}
