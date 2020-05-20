package ServiceInterface.com;

public interface LoginServiceInterface {

	String Login(String name, String password);

	Integer nameVerification(String name);

	Integer register(String name, String password);

}
