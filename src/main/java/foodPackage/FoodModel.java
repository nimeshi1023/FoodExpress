package foodPackage;

public class FoodModel {
	private int food_id;
	private String name;
	private String res_name;
	private String category;
	private String available;
	private String size;
	private float price;
	
	public FoodModel(int food_id, String name, String res_name, String category, String available, String size, float price) {
		this.food_id = food_id;
		this.name = name;
		this.res_name = res_name;
		this.category = category;
		this.available = available;
		this.size = size;
		this.price = price;
	}

	public int getFood_id() {
		return food_id;
	}
	
	public void setFood_id(int food_id) {
		this.food_id = food_id;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	
	
	
}
