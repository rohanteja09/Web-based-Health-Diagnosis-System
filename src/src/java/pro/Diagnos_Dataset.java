package pro;

import au.com.bytecode.opencsv.CSVReader;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Diagnos_Dataset extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ServletContext sc=request.getSession().getServletContext();
        MultipartRequest m=new MultipartRequest(request,sc.getRealPath("DataSets"));
            File file=m.getFile("file");
            String fname=file.getName();
            String csvFile =sc.getRealPath("DataSets")+"\\"+fname;
            CSVReader reader = null;
            try
            {
                System.out.println("entering ........"); 
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/disease_prediction","root","Murali@123");
                PreparedStatement paa= con.prepareStatement("truncate table dataset1");
                paa.executeUpdate();            
                reader = new CSVReader(new FileReader(csvFile));
                String[] line;
                while ((line = reader.readNext()) != null)
                {
                    String sql = "insert into dataset1(pid,a,b,c,d,e,f,g,h) values('"+line[0]+"','"+line[1]+"','"+line[2]+"','"+line[3]+"','"+line[4]+"','"+line[5]+"','"+line[6]+"','"+line[7]+"','"+line[8]+"') ";		    
                    PreparedStatement ps=con.prepareStatement(sql);
                    ps.executeUpdate();
                    System.out.println(sql);
                }
                out.println("<script type=\"text/javascript\">"); 			
		out.println("alert(\"Succesfully Updated in database\")");
		out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("UploadDataSet.jsp");
		rd.include(request,response);
            } catch (IOException | SQLException e) 
            {
                System.out.println(e);
            } 
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Diagnos_Dataset.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Diagnos_Dataset.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
