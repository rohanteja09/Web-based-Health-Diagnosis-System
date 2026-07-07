/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pro;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Datasets extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        ServletContext sc=request.getSession().getServletContext();
        MultipartRequest gets=new MultipartRequest(request,sc.getRealPath("DataSets"));
        File f=gets.getFile("data");
        try
        {
            System.out.println("entering ........"); 
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/disease_prediction","root","Murali@123");
            PreparedStatement query=con.prepareStatement("truncate table dataset");
            query.executeUpdate();
            con.setAutoCommit(false);
            PreparedStatement pstm = null ;
            FileInputStream input = new FileInputStream(f.getAbsolutePath());
            POIFSFileSystem fs = new POIFSFileSystem( input );
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);
            HSSFRow row; 
            for(int i=1; i<=sheet.getLastRowNum(); i++)
            {
                row = sheet.getRow(i);
                Double a = row.getCell(0).getNumericCellValue();
                Double b = row.getCell(1).getNumericCellValue();
                Double c = row.getCell(2).getNumericCellValue();
                Double d = row.getCell(3).getNumericCellValue();
                Double e = row.getCell(4).getNumericCellValue();
                Double f1 = row.getCell(5).getNumericCellValue();
                Double g = row.getCell(6).getNumericCellValue();
                Double h = row.getCell(7).getNumericCellValue();
                Double i1 = row.getCell(8).getNumericCellValue();
                Double j = row.getCell(9).getNumericCellValue();
                Double k = row.getCell(10).getNumericCellValue();
                Double l = row.getCell(11).getNumericCellValue();
                Double m = row.getCell(12).getNumericCellValue();
                Double n = row.getCell(13).getNumericCellValue();
                Double o = row.getCell(14).getNumericCellValue();
                String p = row.getCell(15).getStringCellValue();
                
                String sql = "insert into dataset values('"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f1+"','"+g+"','"+h+"','"+i1+"','"+j+"','"+k+"','"+l+"','"+m+"','"+n+"','"+o+"','"+p+"')";
                pstm = (PreparedStatement) con.prepareStatement(sql);
                pstm.execute();
                System.out.println("Import rows "+i);
                con.commit();
                pstm.close();
            }
            con.close();
            input.close();
            System.out.println("Success import excel to mysql table");
        }
        catch(SQLException | ClassNotFoundException | java.lang.NullPointerException e)
        {
            System.out.println(e);  
        }
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">"); 			
        out.println("alert(\"Succesfully Updated for sql\")");
        out.println("</script>");
        RequestDispatcher rd=request.getRequestDispatcher("UploadDataSet.jsp");  
        rd.include(request,response);
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
