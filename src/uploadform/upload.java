package uploadform;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import database.adminDBUpload;

/**
 * Servlet implementation class upload
 */
@WebServlet("/upload")
public class upload extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category=null,name=null,price=null,deposit=null,rent=null,model=null,color=null,dimension=null,
				wg=null,manu=null;
		String img_url[]=new String[4];
		int i=0;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		if (!isMultipartContent) {
			return;
		}
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> fields = upload.parseRequest(request);
			Iterator<FileItem> it = fields.iterator();
			if (!it.hasNext()) {
				return;
			}
			while (it.hasNext()) {
				FileItem fileItem = it.next();
				boolean isFormField = fileItem.isFormField();
				if (isFormField) {
					if (category == null) {
						if (fileItem.getFieldName().equals("category")) {
							category = fileItem.getString();
						}
					}
					else if (name == null) {
						if (fileItem.getFieldName().equals("name")) {
							name = fileItem.getString();
						}
					}
					else if (price == null) {
						if (fileItem.getFieldName().equals("price")) {
							price = fileItem.getString();
						}
					}
					else if (deposit == null) {
						if (fileItem.getFieldName().equals("refund")) {
							deposit = fileItem.getString();
						}
					}
					else if (rent == null) {
						if (fileItem.getFieldName().equals("rent")) {
							rent = fileItem.getString();
						}
					}
					else if (model == null) {
						if (fileItem.getFieldName().equals("modelnumber")) {
							model = fileItem.getString();
						}
					}
					else if (color == null) {
						if (fileItem.getFieldName().equals("color")) {
							color = fileItem.getString();
						}
					}
					else if (dimension == null) {
						if (fileItem.getFieldName().equals("dimension")) {
							dimension = fileItem.getString();
						}
					}
					else if (wg == null) {
						if (fileItem.getFieldName().equals("weight")) {
							wg = fileItem.getString();
						}
					}
					else if (manu == null) {
						if (fileItem.getFieldName().equals("manfu")) {
							manu = fileItem.getString();
						}
					}
				} else {
					
					if (fileItem.getSize() > 0) {
						fileItem.write(new File("C:\\Users\\tamil\\eclipse-workspace\\BasicServlet\\WebContent\\ImgUploaded\\" + fileItem.getName()));
						img_url[i]="ImgUploaded/"+fileItem.getName();
						i++;
					}
				}
			}
			adminDBUpload obj=new adminDBUpload();
			boolean check= obj.adminFormUpload(category, name, price, deposit,  rent, model,  color, dimension, 
					wg, manu,img_url[0],img_url[1],img_url[2],img_url[3]); 
			if(check) {
			
				request.setAttribute("alert", "uploadSuccess");
				RequestDispatcher rd=request.getRequestDispatcher("adminUpload.jsp");
				rd.forward(request, response);
			}
		
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.print("first 4 file will be uploaded \n");
		}
		catch (Exception e) {
			System.out.print(e);
		}
//		for(String a: img_url)
//			System.out.print(a+"\n");
//		System.out.println(category+"/"+name+"/"+price+"/"+deposit+"/"+rent+"/"+model+"/"
//				+color+"/"+dimension+"/"+wg+"/"+manu);
		
	}

}
