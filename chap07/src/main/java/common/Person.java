/**
 * 
 */
package common;

/**
 * 
 */
public class Person {
	private String name;
	private int age;
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
	//private void setAge(int age) -> 조회만 가능하게 할거야.
	public void setAge(int age) {
		this.age = age;
	}

	public Person(){}
	
	public Person(String name, int age) { 
		//필드가 private인데 어떻게 생성자에 값을 주입해서 할당할 수 있지? 생성자는 같은 클래스 내에 있어서 접근이 가능해.
		this.name = name;
		this.age = age;
	}
	
}


