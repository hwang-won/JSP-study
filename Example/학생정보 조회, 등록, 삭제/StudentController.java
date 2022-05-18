package ch09;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/studentControl")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	StudentDAO dao;
	
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = new StudentDAO();
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	String action = request.getParameter("action");
    	String view = "";
    	
    	if(request.getParameter("action") == null) {
			getServletContext().getRequestDispatcher("/studentControl?action=list")
			.forward(request, response);
		}else {
			switch (action) {
			case "list": view = list(request,response);	break;
			case "insert": view = insert(request,response);	break;
			}
			getServletContext().getRequestDispatcher("/ch09/"+view)
			.forward(request, response);
		}
	}
    
	// dao.getAll()메서드 호출한 결과를 students에 저장하고 뷰에 리턴
    public String list(HttpServletRequest request, HttpServletResponse response) {
    	request.setAttribute("students", dao.getAll());
    	return "studentInfo.jsp";
    }
    
    // request.getParameterMap()를 이용해 모든 입력값을 읽어와 Student 객체로 매핑 후 dao.insert(s)메서드 호출
    // 입력값을 일일이 매필하기 보다는 아파치 BeanUtil 라이브러리 사용함
    // Student 객체 생성 후 BeanUtils.populate()메서드로 파라미터로 전달된 name 속성과 일치하는 Student 클래스의 멤버 변수를 찾아 값이 전달
    // 그 후 dao.insert()메서드로 새로운 데이터를 저장한 후 list()메서드를 호출해 새로운 목록 화면 표시
    public String insert(HttpServletRequest request, HttpServletResponse response) {
    	Student s = new Student();
    	try {
    		BeanUtils.populate(s, request.getParameterMap());
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	dao.insert(s);
    	return list(request, response);
    }
}
