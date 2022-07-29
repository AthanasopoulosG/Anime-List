package animelist;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.swing.filechooser.FileSystemView;

public class FileHandler {
	boolean saved = false;
	boolean updateCompleted = false;

	public static File main() {
		try {
			/*String dir = FileSystemView.getFileSystemView().getDefaultDirectory().getPath() + "/Anime-List/";
			File DirectoryCreation = new File(dir);
			boolean res = DirectoryCreation.mkdir();
			if (res) {
				//System.out.println("The directory has been created.");
			} else {
				//System.out.println("The directory already exists.");
			}
			// inside tomcat server this is nowhere to be found
			//FileSystemView.getFileSystemView().getDefaultDirectory().getPath();
			String path = FileSystemView.getFileSystemView().getDefaultDirectory().getPath()
						+ "/Anime-List/AnimeList.txt";*/
			File f = new File("AnimeList.txt");

			if (f.createNewFile()) {
				//System.out.println("File created: " + f.getAbsolutePath());
			} else {
				//System.out.println("File already exists.");
			}

			return f;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public void SaveAnime(Anime anime) {

		
		try {
			String str = "";
			File f = main();
			List<Anime> ani = SortAnimes(anime);
			FileWriter fr = new FileWriter(f);
			
			for (Anime a : ani) {
				str = a.getName() + "||" + a.getType() + "||" + a.getGenre() + "||" + a.getImage() + "||"
						+ a.getSeason() + "||" + a.getStatus() + "||" + a.getEpisodes() + "||" + a.getRating()
						+ "||" + a.getSummary() + "||" + a.getNotes() + "\n";
				fr.write(str);
			}

			
			saved = true;
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
	public void SaveAll(List<Anime> animes) {

		
		try {
			String str = "";
			File f = main();
			FileWriter fr = new FileWriter(f);
			
			for (Anime a : animes) {
				str = a.getName() + "||" + a.getType() + "||" + a.getGenre() + "||" + a.getImage() + "||"
						+ a.getSeason() + "||" + a.getStatus() + "||" + a.getEpisodes() + "||" + a.getRating()
						+ "||" + a.getSummary() + "||" + a.getNotes() + "\n";
				fr.write(str);
			}

			
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public void DeleteAnime(String name) {

		
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);
			List<Anime> animes = new ArrayList<Anime>();
			
			String line;
			while ((line = br.readLine()) != null) {

				String[] animedata = { "" };
				animedata = line.split("[||]+", -1);
				if (!animedata[0].equals(name)) {
					Anime anime = new Anime(animedata[0], animedata[1], animedata[2], animedata[3],
							Integer.parseInt(animedata[4]), animedata[5], Integer.parseInt(animedata[6]),
							Integer.parseInt(animedata[7]), animedata[8], animedata[9]);

					animes.add(anime);
				}
				
			}
			
			fr.close();
			SaveAll(animes);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
	public Anime getAnime(String name) {
		Anime anime = null;
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);
			Boolean found = false;
			String line;
			while (((line = br.readLine()) != null)&& !found ) {

				String[] animedata = { "" };
				animedata = line.split("[||]+", -1);
				if (animedata[0].equals(name)) {
					anime = new Anime(animedata[0], animedata[1], animedata[2], animedata[3],
							Integer.parseInt(animedata[4]), animedata[5], Integer.parseInt(animedata[6]),
							Integer.parseInt(animedata[7]), animedata[8], animedata[9]);
					
					found = true;
				}
				
			}
			
			br.close();
			return anime;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	public List<Anime> readAllFromFile() {

		List<Anime> animes = new ArrayList<Anime>();
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);

			String line;
			while ((line = br.readLine()) != null) {

				String[] animedata = { "" };
				animedata = line.split("[||]+", -1);
				
				Anime anime = new Anime(animedata[0], animedata[1], animedata[2], animedata[3],
						Integer.parseInt(animedata[4]), animedata[5], Integer.parseInt(animedata[6]),
						Integer.parseInt(animedata[7]), animedata[8], animedata[9]);

				animes.add(anime);

			}

			br.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return animes;
	}
	
	
	public List<Anime> CompletedList() {
		
		List<Anime> Completed = new ArrayList<Anime>();
		
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);

			String line;
			while ((line = br.readLine()) != null) {

				String[] animedata = { "" };
				animedata = line.split("[||]+", -1);
				Anime anime = new Anime(animedata[0], animedata[1], animedata[2], animedata[3],
						Integer.parseInt(animedata[4]), animedata[5], Integer.parseInt(animedata[6]),
						Integer.parseInt(animedata[7]), animedata[8], animedata[9]);
				
				if (anime.getStatus().equals("Completed")) {
					Completed.add(anime);

				}

			}
			br.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return Completed;
	}
	
	public List<Anime> OngoingList() {
		
		List<Anime> Ongoing = new ArrayList<Anime>();
		
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);

			String line;
			while ((line = br.readLine()) != null) {

				String[] animedata = { "" };
				animedata = line.split("[||]+", -1);
				
				Anime anime = new Anime(animedata[0], animedata[1], animedata[2], animedata[3],
						Integer.parseInt(animedata[4]), animedata[5], Integer.parseInt(animedata[6]),
						Integer.parseInt(animedata[7]), animedata[8], animedata[9]);
				
				if (anime.getStatus().equals("Ongoing")) {
					Ongoing.add(anime);

				}

			}
			br.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return Ongoing;
	}
	
	
	public List<Anime> ToWatchList() {
		
		List<Anime> ToWatch = new ArrayList<Anime>();
		
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);

			String line;
			while ((line = br.readLine()) != null) {

				String[] animedata = { "" };
				animedata = line.split("[||]+", -1);
				
				Anime anime = new Anime(animedata[0], animedata[1], animedata[2], animedata[3],
						Integer.parseInt(animedata[4]), animedata[5], Integer.parseInt(animedata[6]),
						Integer.parseInt(animedata[7]), animedata[8], animedata[9]);
				
				if (anime.getStatus().equals("To Watch")) {
					ToWatch.add(anime);
				}

			}
			br.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return ToWatch;
	}
	
	
	public List<Anime> getSearch(String name) {
		
		List<Anime> search = new ArrayList<Anime>();
		
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);

			String line;
			while ((line = br.readLine()) != null) {

				String[] animedata = { "" };
				animedata = line.split("[||]+", -1);
				if (animedata[0].contains(name)) {
					Anime anime = new Anime(animedata[0], animedata[1], animedata[2], animedata[3],
							Integer.parseInt(animedata[4]), animedata[5], Integer.parseInt(animedata[6]),
							Integer.parseInt(animedata[7]), animedata[8], animedata[9]);
				
				
					search.add(anime);

				}

			}
			br.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return search;
	}


	public boolean AnimeExists(String name) {
		
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);

			String line;
			while ((line = br.readLine()) != null) {

				String[] animedata = { "" };
				animedata = line.split("[ ||]+");
				if (animedata[0].equals(name)) {
					br.close();
					return true;
				}
			}
			
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	
	public List<Anime> UpdateSummary(String name, String text) {
		
		List<Anime> animes = new ArrayList<Anime>();
		
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);

			String line;
			while ((line = br.readLine()) != null) {

				String[] animedata = { "" };
				animedata = line.split("[||]+", -1);
				Anime anime = new Anime(animedata[0], animedata[1], animedata[2], animedata[3],
						Integer.parseInt(animedata[4]), animedata[5], Integer.parseInt(animedata[6]),
						Integer.parseInt(animedata[7]), animedata[8], animedata[9]);
				if (animedata[0].equals(name)) {
					anime.setSummary(text);
				}
				animes.add(anime);
			}
			br.close();
			updateCompleted = true;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return animes;
	}


	public List<Anime> UpdateNotes(String name, String text) {
		
		List<Anime> animes = new ArrayList<Anime>();
		
		try {
			File f = main();
			FileReader fr = new FileReader(f); // reads the file
			BufferedReader br = new BufferedReader(fr);

			String line;
			while ((line = br.readLine()) != null) {

				String[] animedata = { "" };
				animedata = line.split("[||]+", -1);
				Anime anime = new Anime(animedata[0], animedata[1], animedata[2], animedata[3],
						Integer.parseInt(animedata[4]), animedata[5], Integer.parseInt(animedata[6]),
						Integer.parseInt(animedata[7]), animedata[8], animedata[9]);
				if (animedata[0].equals(name)) {
					anime.setNotes(text);
				}
				animes.add(anime);
			}
			br.close();
			updateCompleted = true;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return animes;
	}
	private List<Anime> SortAnimes(Anime anime) {

		List<Anime> animes = null;
		List<Anime> SortedList = new ArrayList<Anime>();
		animes = readAllFromFile();
		if (animes.isEmpty()) {
			SortedList.add(anime);
			
			return SortedList;
		}
		
		boolean notfound = true;
		for (Anime a : animes) {
			if (notfound) {	
				if (anime.getName().compareTo(a.getName()) < 0) {
					SortedList.add(anime);
					notfound = false;
				} 
			}
			SortedList.add(a);
					
		}
		if (notfound) {
			SortedList.add(anime);
		}
		return SortedList;
	}

	public void resetFile() {

		try {
			File f = main();
			FileWriter fr = new FileWriter(f);
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public boolean returnsaved() {
		return saved;
	}

	public boolean getupdateSum() {
		return updateCompleted;
	}

}
