package cn.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import cn.controller.BaseAction;

import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
@Controller("uploadAction")
public class UploadAction extends BaseAction
{
	private static final int BUFFER_SIZE = 16 * 1024;
	private File fujian;
	private String fujianFileName;
	private String fujianContentType;
	
	
	public String upload() throws IOException
	{
		String newFujianName=Const.getFileId()+fujianFileName.substring(fujianFileName.indexOf("."));
		String dstPath = ServletActionContext.getServletContext().getRealPath("upload")+ "\\" + newFujianName;
		File dstFile = new File(dstPath);
		copy(this.getFujian(),dstFile);
//		Map request=(Map)ServletActionContext.getContext().get("request");
//		request.put("newFujianName", newFujianName);
//		request.put("oldFujianName", fujianFileName);
//		request.put("fujianPath", "/upload"+ "/" + newFujianName);
		//response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print("upload/"+newFujianName);
		out.close();
		return null;

	}
	
	
	private static void copy(File src, File dst) 
    {
        InputStream in = null;
        OutputStream out = null;
        try 
        {
            in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
            out = new BufferedOutputStream(new FileOutputStream(dst),BUFFER_SIZE);
            byte[] buffer = new byte[BUFFER_SIZE];
            int len = 0;
            while ((len = in.read(buffer)) > 0) 
            {
                out.write(buffer, 0, len);
            }
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        } 
        finally
        {
            if (null != in) 
            {
                try 
                {
                    in.close();
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
            if (null != out) 
            {
                try 
                {
                    out.close();
                } 
                catch (IOException e) 
                {
                    e.printStackTrace();
                }
            }
        }
    }


	public File getFujian()
	{
		return fujian;
	}


	public void setFujian(File fujian)
	{
		this.fujian = fujian;
	}


	public String getFujianContentType()
	{
		return fujianContentType;
	}


	public void setFujianContentType(String fujianContentType)
	{
		this.fujianContentType = fujianContentType;
	}


	public String getFujianFileName()
	{
		return fujianFileName;
	}


	public void setFujianFileName(String fujianFileName)
	{
		this.fujianFileName = fujianFileName;
	}

}
