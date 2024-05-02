package member;

public class Person {
	private String name;
	private int age;
	private String sex;
	public String sex2;
	
	public Person() {}
	
	public Person(String name, int age, String sex) {
		this.name = name;
		this.age = age;
		this.sex = sex;
		this.sex2 = sex;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the age
	 */
	public int getAge() {
		return age;
	}
	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}
	/**
	 * @return the set
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param set the set to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	
}
