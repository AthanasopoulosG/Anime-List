package animelist;






	
public class Anime {
	String name;
	String type;
	String genre;
	String image;
	int seasons;
	String status;
	int episodes;
	int rating;
	String summary;
	String notes;

      public  Anime (String name, String type, String genre,String image ,int seasons,String status , int episodes,int rating,String summary,String notes) {
		this.name = name;
		this.type = type;
		this.genre = genre;
		this.image = image;
		this.seasons = seasons;
		this.status = status;
		this.episodes = episodes;
		this.rating = rating;
		this.summary=summary;
		this.notes=notes;
	}	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getSeason() {
		return seasons;
	}
	public void setSeason(int seasons) {
		this.seasons = seasons;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getEpisodes() {
		return episodes;
	}
	public void setEpisodes(int episodes) {
		this.episodes = episodes;
	}
	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}
