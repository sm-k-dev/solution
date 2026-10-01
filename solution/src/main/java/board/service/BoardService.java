package board.service;

import java.util.List;
import board.dao.BoardDAO;
import board.dto.BoardDTO;

public class BoardService {
    public static final int PAGE_SIZE = 10;
    private final BoardDAO boardDAO;
    public BoardService(BoardDAO boardDAO) { this.boardDAO = boardDAO; }
    public List<BoardDTO> findPage(String category,String query,int page) throws Exception {
        int safePage=Math.max(1,page);
        return boardDAO.findPage(category,query,(safePage-1)*PAGE_SIZE,PAGE_SIZE);
    }
    public int count(String category,String query) throws Exception { return boardDAO.count(category,query); }
    public int pageCount(int total) { return Math.max(1,(total+PAGE_SIZE-1)/PAGE_SIZE); }
    public static boolean isCategory(String category) {
        return "NOTICE".equals(category)||"RESOURCE".equals(category)||"FREE".equals(category);
    }
    public static String clean(String value) { return value==null?"":value.trim(); }
}
