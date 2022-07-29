package myanime;

//import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AnimeServlet
 */
@WebServlet("/")
public class AnimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AnimeDAL anidal;
	private List<Anime> listA;
	private boolean animeSaved = true;

	String[] genres={"Action","Adventure","Mecha","School","Comedy",
					"Demons","Supernatural","Magic","Romance","Fantasy","Ecchi",
					"Super Power","Horror","Game","Music","Sports","Harem","Military",
					"Sci-fi","Slice of life","Thriller","Vampire","Space"};
	private String type="&#9776;";	//default 1st organize method 
   
	public void init() {
		anidal = new AnimeDAL();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/add":
				showNewForm(request, response);
				break;
			case "/insert":
				insert(request, response);
				break;
			case "/delete":
				delete(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateAnime(request, response);
				break;
			case "/Anime_search":
				search(request, response);
				break;
			case "/comp":
				completed(request, response);
				break;
			case "/ongoing":
				ongoing(request, response);
				break;
			case "/towatch":
				towatch(request, response);
				break;
			case "/organize":
				organize(request, response);
				break;	
			case "/summ":
				sum(request, response);
				break;	
			case "/notes":
				note(request, response);
				break;	
			case "/Save_text_Display":
				savetxt(request, response);
				break;
			case "/Display":
				display(request, response);
				break;
			case "/Cancel":
				canceled(request, response);
				break;	
			case "/genre":
				Genre_search(request, response);
				break;	
			case "/list":
				list(request, response);
				break;
			case "/error_page":
				error(request, response);
				break;
			default:
				home(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
		
	}
	
	private void home(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void list(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
			List<Anime> list = anidal.getAllAnime();
			request.setAttribute("list", list);
			request.setAttribute("saved", animeSaved);
			request.setAttribute("status", "all");
			request.setAttribute("coding", type);
			animeSaved = true ;
			if (list != null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("msg", "The list is empty or null check DB accessibility !!!");
				error(request, response);
			}
		
	}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Add.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		
		String name = request.getParameter("id");
		Anime anime = anidal.getAnime(name); 
		RequestDispatcher dispatcher = request.getRequestDispatcher("Update.jsp");
		request.setAttribute("anime", anime);
		dispatcher.forward(request, response);

	}
	
	private void updateAnime(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String path = request.getParameter("myfile");	// if no file selected string is empty
		int seasons = Integer.parseInt(request.getParameter("season"));
		String status = request.getParameter("status");
		int episodes = Integer.parseInt(request.getParameter("episode"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		Anime animep = anidal.getAnime(name);
		String sum = animep.getSummary();
		String note = animep.getNotes();
		
		//		****	Get all Genres  ****
		String genre = "";
		for (int i=0;i<genres.length;i++) {
			if (request.getParameter(genres[i])!=null) {
				genre= genre+ genres[i]+", ";
			}
		}
		
		if (genre.length() > 0) {
			genre = genre.substring(0, genre.length()-2);	//cleaning last comma ,
		}
		
		//	--------	End of Genre search	--------
		
		// ---- Check for new image file entry otherwise use last file name ----
		String lastpath = animep.getImage();
		if (path.equals("")) {
			path = lastpath;
		}
		// ---- 
		Anime ani = new Anime( name, type,genre,path,seasons,status,episodes,rating,sum,note);
		anidal.updateAnime(ani);
		response.sendRedirect("list");
	}
	
	private void insert(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		String name = request.getParameter("name");
		name = name.toUpperCase();
		String type = request.getParameter("type");
		String path = request.getParameter("myfile");
		String genre="";
		int seasons = Integer.parseInt(request.getParameter("season"));
		String status = request.getParameter("status");
		int episodes = Integer.parseInt(request.getParameter("episode"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		Anime ani ;
		
		for (int i=0;i<genres.length;i++) {
			if (request.getParameter(genres[i])!=null) {
				genre= genre+ genres[i]+", ";
			}
		}
		
		if (genre.length() > 0) {
			genre = genre.substring(0, genre.length()-2);	//cleaning last comma ,
		}
		ani = anidal.getAnime(name);
		
		// anime doesn t exist in database 
		if (ani==null) {
			
			ani= new Anime (name,type,genre,path,seasons,status,episodes,rating," "," ");
			anidal.saveAnime(ani);
			
			if(anidal.returnsaved()) {
				// anime saved successfully
				response.sendRedirect("list");
			} else {
				//error during saving 
				String error="666";
				request.setAttribute("error", error);
				error(request, response);
			}
			
			
		} else {
			//TODO if anime exists 
			animeSaved = false ;
			response.sendRedirect("list");
		}
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		String name = request.getParameter("id");
		anidal.delete(name);
		response.sendRedirect("list");
	}
	
	
	private void search(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		String temp = request.getParameter("one");
		String name = request.getParameter("name");
		name=name.toUpperCase();
		
		if(!temp.equals(type)) {
			type=temp;
		}
		
		listA = null;
		listA  = anidal.getsearch(name);
		if (!listA.isEmpty()) {
			request.setAttribute("search", name);
			request.setAttribute("found", "yes");
			request.setAttribute("list",listA );
			request.setAttribute("coding", type);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
			dispatcher.forward(request, response);
	
		} else {
			//todo if anime doesnt exist!!
			request.setAttribute("found", "no");
			request.setAttribute("search", name);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Search.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	
	private void completed(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Anime> list = anidal.getCompletedAnime();
		
		request.setAttribute("coding", type);
		request.setAttribute("list", list);
		request.setAttribute("saved", animeSaved);
		request.setAttribute("status", "completed");
		if (list != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("msg", "The list is empty or null check DB accessibility !!!");
			error(request, response);
		}
	}
	
	private void ongoing(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Anime> list = anidal.getOngoingAnime();
		
		request.setAttribute("coding", type);
		request.setAttribute("list", list);
		request.setAttribute("saved", animeSaved);
		request.setAttribute("status", "ongoing");
		if (list != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("msg", "The list is empty or null check DB accessibility !!!");
			error(request, response);
		}
	}
	
	private void towatch(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Anime> list = anidal.getTOWatchAnime();
		
		request.setAttribute("coding", type);
		request.setAttribute("list", list);
		request.setAttribute("saved", animeSaved);
		request.setAttribute("status", "towatch");
		if (list != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("msg", "The list is empty or null check DB accessibility !!!");
			error(request, response);
		}
	}
	
	private void organize(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String temp = request.getParameter("one");
		String status = request.getParameter("status");
		
		if(!temp.equals(type)) {
			type=temp;
		}
		switch (status) {
		case "completed":
			completed(request, response);
			break;
		case "ongoing":
			ongoing(request, response);
			break;	
		case "towatch":
			towatch(request, response);
			break;	
		default:
			request.setAttribute("type", type);
			response.sendRedirect("list");
			break;
		}
	}
	
	
	private void sum(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String name = request.getParameter("name");
		String type = "summary";
		Anime anime = anidal.getAnime(name);
		request.setAttribute("name", name);
		request.setAttribute("ty", type);
		request.setAttribute("content", anime.getSummary());
		request.setAttribute("image", anime.getImage());
		RequestDispatcher dispatcher = request.getRequestDispatcher("TextForm.jsp");
		dispatcher.forward(request, response);
	}
	
	private void note(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String name = request.getParameter("name");
		String type = "note";
		Anime anime = anidal.getAnime(name);
		request.setAttribute("name", name);
		request.setAttribute("ty", type);
		request.setAttribute("content", anime.getNotes());
		request.setAttribute("image", anime.getImage());
		RequestDispatcher dispatcher = request.getRequestDispatcher("TextForm.jsp");
		dispatcher.forward(request, response);
	}
	
	private void savetxt(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		String text = request.getParameter("text");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		
		
		if(type.equals("summary")) {
			// pass anime and boolean to show if update succeeded
			
			anidal.updateSummary(name, text);
		} else {
			anidal.updateNotes(name, text);
		}
		boolean done= anidal.getupdateSum();
		Anime anime = anidal.getAnime(name);
		
		request.setAttribute("show", "yes");
		request.setAttribute("anime", anime);
		request.setAttribute("success", done);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Display.jsp");
		dispatcher.forward(request, response);
	}
	
	private void display(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		// Display after pressing on an anime border
		String name = request.getParameter("id");
		Anime anime = anidal.getAnime(name);
		request.setAttribute("show", "no");
		request.setAttribute("anime", anime);
		request.setAttribute("success", "no");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Display.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void canceled(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		response.sendRedirect("list");
	}
	
	private void Genre_search(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		
		try {
			List<Anime> l = anidal.getAllAnime(); 
		
			
			request.setAttribute("list", l);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Genre.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("error_page.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	
	private void error(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("error_page.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	public String[] getGenres() {
		return genres;
	}
	
	public String[] getCurGenres(String curgen) {
		
		// break array string into a list and check each string with the genre for  update 
		
		String[] curgenres = {""};
		curgenres = curgen.split(", ");
		
		return curgenres;
	}
	

}
