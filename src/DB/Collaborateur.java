package DB;

public class Collaborateur {
	protected int id;
	protected int code_mission;
	protected String nom;
	protected String profel;
	
	public Collaborateur(int id, int code_mission, String nom, String profel) {
		super();
		this.id = id;
		this.code_mission = code_mission;
		this.nom = nom;
		this.profel = profel;
	}
	
	public Collaborateur(int code_mission, String nom, String profel) {
		super();
		this.code_mission = code_mission;
		this.nom = nom;
		this.profel = profel;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCode_mission() {
		return code_mission;
	}
	public void setCode_mission(int code_mission) {
		this.code_mission = code_mission;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getProfel() {
		return profel;
	}
	public void setProfel(String profel) {
		this.profel = profel;
	}
}

