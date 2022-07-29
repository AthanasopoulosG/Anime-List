package animelist;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FileHandler fh;
	String[] genres={"Action","Adventure","Mecha","School","Comedy",
			"Demons","Supernatural","Magic","Romance","Fantasy","Ecchi",
			"Super Power","Horror","Game","Music","Sports","Harem","Military",
			"Sci-fi","Slice of life","Thriller","Vampire","Space"};
	private String type="&#9776;";	//default 1st organize method 
	
	public void init() {
		fh = new FileHandler();
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
			case "/delete":
				delete(request, response);
				break;
			case "/home":
				home(request, response);
				break;
			case "/insert":
				insert(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateAnime(request, response);
				break;
			case "/list":
				list(request, response);
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
			case "/Anime_search":
				search(request, response);
				break;
			case "/genre":
				Genre_search(request, response);
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
			default:
				//filecreator(request, response);
				break;
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
		/*try {
			switch (action) {
			
			
			
			
				
				
			case "/error_page":
				error(request, response);
				break;
			default:
				home(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}*/
		
	}
	
	
	private void filecreator(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		//new Anime (name,type,genre,path,seasons,status,episodes,rating," "," ");
		Anime ani = new Anime ("Goku","Series","WAAAAAAAAAAAAA","-",4,"Completed",100,55,"-"," ");	
		Anime ani2 = new Anime ("gr","qwe","fe","-",4,"ongoing",100,55,"-","-");	
		Anime ani3 = new Anime ("Gokwaeu","wd","jj","-",4,"TOWatch",100,55,"-","-");	
		// enter a symbol to check for empty spot since split ignores it
		FileHandler fh = new FileHandler();
		fh.readAllFromFile();
		fh.SaveAnime(ani);
		fh.SaveAnime(ani2);
		fh.SaveAnime(ani3);
		//fh.resetFile();
		//fh.readAllFromFile();
		System.out.println("outside of file creation ");
	}
	
	
	private void list(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
			List<Anime> list = fh.readAllFromFile();
			
			for (Anime a:list) {
				newlinehandle(a);
			}
			
			request.setAttribute("list", list);
			request.setAttribute("status", "all");
			request.setAttribute("coding", type);
			if (list != null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("msg", "The list is empty or file got damaged !!!");
				error(request, response);
			}
		
	}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Add.jsp");
		dispatcher.forward(request, response);
	}
	
	
	
	private void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("name");							// required
		name = name.toUpperCase();
		String type = request.getParameter("type");							// required
		String path = request.getParameter("myfile");
		String genre="";
		int seasons = Integer.parseInt(request.getParameter("season"));
		String status = request.getParameter("status");						// required	
		int episodes = Integer.parseInt(request.getParameter("episode"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		
		for (int i=0;i<genres.length;i++) {
			if (request.getParameter(genres[i])!=null) {
				genre= genre+ genres[i]+", ";
			}
		}
		
		if (genre.length() > 0) {
			genre = genre.substring(0, genre.length()-2);	//cleaning last comma ,
		}
		
		if (path.equals("")) {
			path = " ";
		}
		
		if (genre.equals("")) {
			genre = " ";
		}
		fh = new FileHandler();
		if (fh.AnimeExists(name)) {
			//animeSaved = false ;
			response.sendRedirect("list");
		} else {
			
			Anime ani = new Anime(name, type,genre,path,seasons,status,episodes,rating," "," ");
			fh.SaveAnime(ani);
			response.sendRedirect("list");
		}
		
	}
	
	
	private void delete(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		String name = request.getParameter("id");
		fh.DeleteAnime(name);
		response.sendRedirect("list");
	}
	
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("id");
		Anime anime = fh.getAnime(name); 
		RequestDispatcher dispatcher = request.getRequestDispatcher("Update.jsp");
		request.setAttribute("anime", anime);
		dispatcher.forward(request, response);

	}
	
	
	private void updateAnime(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException  {
		
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String path = request.getParameter("myfile");	// if no file selected string is empty
		int seasons = Integer.parseInt(request.getParameter("season"));
		String status = request.getParameter("status");
		int episodes = Integer.parseInt(request.getParameter("episode"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		
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
		Anime anilast = fh.getAnime(name);
		if (path.equals("")) {
			path = anilast.getImage();
		}
		// ---- 
		String sum = anilast.getSummary();
		String notes = anilast.getNotes();
		List<Anime> allanime = fh.readAllFromFile();
		List<Anime> dublist = new ArrayList<Anime>();
		Anime ani = new Anime( name, type,genre,path,seasons,status,episodes,rating,sum,notes);
		for (Anime a:allanime) {
			if(name.equals(a.name)) {
				dublist.add(ani);
				continue;
			}
			dublist.add(a);
		}
		fh.SaveAll(dublist);
		response.sendRedirect("list");
	}
	
	
	private void completed(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		List<Anime> list = fh.CompletedList();
		
		request.setAttribute("coding", type);
		request.setAttribute("list", list);
		request.setAttribute("status", "completed");
		if (list != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("msg", "The list is empty or file is corrupted !!!");
			error(request, response);
		}
	}
	
	
	private void ongoing(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		List<Anime> list = fh.OngoingList();
		
		request.setAttribute("coding", type);
		request.setAttribute("list", list);
		request.setAttribute("status", "ongoing");
		if (list != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("msg", "The list is empty or file is corrupted !!!");
			error(request, response);
		}
	}
	
	
	private void towatch(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		List<Anime> list = fh.ToWatchList();
		
		request.setAttribute("coding", type);
		request.setAttribute("list", list);
		request.setAttribute("status", "towatch");
		if (list != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("List.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("msg", "The list is empty or file is corrupted !!!");
			error(request, response);
		}
	}
	
	
	private void home(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		List<Anime> list = fh.OngoingList();
		List<Anime> fivergoing = new ArrayList<Anime>();
		Random rand = new Random();
		for (int i=0 ; i<5 ; i++){
	    	if (list != null){
		    	if (!list.isEmpty()){
		    		int rand_num = rand.nextInt( list.size() );
		    		fivergoing.add(list.get( rand_num ) );
		    		list.remove(rand_num);
		    	}
	    	} 	    	
	    }
	    
		request.setAttribute("list" , fivergoing);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void organize(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
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
	
	
	private void search(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		String temp = request.getParameter("one");
		String name = request.getParameter("name");
		name=name.toUpperCase();
		
		if(!temp.equals(type)) {
			type=temp;
		}
		
		List<Anime> listA  = fh.getSearch(name);
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
	
	
	private void sum(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String name = request.getParameter("name");
		String type = "summary";
		Anime anime = fh.getAnime(name);
		
		request.setAttribute("name", name);
		request.setAttribute("ty", type);
		request.setAttribute("content", anime.getSummary());
		request.setAttribute("image", anime.getImage());
		RequestDispatcher dispatcher = request.getRequestDispatcher("TextForm.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void note(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String name = request.getParameter("name");
		String type = "note";
		Anime anime = fh.getAnime(name);
		
		request.setAttribute("name", name);
		request.setAttribute("ty", type);
		request.setAttribute("content", anime.getNotes());
		request.setAttribute("image", anime.getImage());
		RequestDispatcher dispatcher = request.getRequestDispatcher("TextForm.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void savetxt(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String text = request.getParameter("text");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		
		List<Anime> List = new ArrayList<Anime>();
		if(type.equals("summary")) {
			// pass anime and boolean to show if update succeeded
			
			List = fh.UpdateSummary(name, text);
		} else {
			List = fh.UpdateNotes(name, text);
		}
		boolean done= fh.getupdateSum();
		fh.SaveAll(List);
		
		Anime anime = fh.getAnime(name);
		newlinehandle(anime);
		
		request.setAttribute("show", "yes");
		request.setAttribute("anime", anime);
		request.setAttribute("success", done);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Display.jsp");
		dispatcher.forward(request, response);
	}
	
	
	private void Genre_search(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		
		try {
			List<Anime> l = fh.readAllFromFile(); 
			request.setAttribute("list", l);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Genre.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("error_page.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	
	private void display(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		// Display after pressing on an anime border
		String name = request.getParameter("id");
		Anime anime = fh.getAnime(name);
		request.setAttribute("show", "no");
		request.setAttribute("anime", anime);
		request.setAttribute("success", "no");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Display.jsp");
		dispatcher.forward(request, response);
		
	}
	
	
	private void canceled(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.sendRedirect("list");
	}
	
	
	private void error(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
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
	
	private void newlinehandle (Anime a) {
		String s = a.summary.replaceAll("/n", "\n");
		String n = a.notes.replaceAll("/n", "\\n");
		a.setSummary(s);
		a.setNotes(n);
	}
	
	
}