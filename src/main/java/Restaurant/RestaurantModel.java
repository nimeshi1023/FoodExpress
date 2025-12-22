package Restaurant;

public class RestaurantModel {
 
	private int id;
	private String name;
	private String location;
	private String description;
	private String pno;
	private String email;
	
	public RestaurantModel(int id, String name, String location, String description, String pno, String email) {
		
		this.id = id;
		this.name = name;
		this.location = location;
		this.description = description;
		this.pno = pno;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
