package board.dto;

public class BoardFileDTO {
    private long fileId;
    private String originalName;
    private String savedName;
    private String filePath;
    private long fileSize;
    private String fileType;
    public long getFileId(){return fileId;} public void setFileId(long v){fileId=v;}
    public String getOriginalName(){return originalName;} public void setOriginalName(String v){originalName=v;}
    public String getSavedName(){return savedName;} public void setSavedName(String v){savedName=v;}
    public String getFilePath(){return filePath;} public void setFilePath(String v){filePath=v;}
    public long getFileSize(){return fileSize;} public void setFileSize(long v){fileSize=v;}
    public String getFileType(){return fileType;} public void setFileType(String v){fileType=v;}
}
