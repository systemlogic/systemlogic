package  com.systemlogic;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class CoreContainer {
 
	@RequestMapping(value = "/springCoreContainer", method = RequestMethod.GET)
	public String getspringCorecontainer(ModelMap model) {
		return "springCoreContainer";
	}
	@RequestMapping(value = "/springContext", method = RequestMethod.GET)
	public String getspringContext(ModelMap model) {
		return "springContext";
	}
	@RequestMapping(value = "/springEL", method = RequestMethod.GET)
	public String getspringEL(ModelMap model) {
		return "springEL";
	}
	@RequestMapping(value = "/springAutoWire", method = RequestMethod.GET)
	public String getspringAutoWire(ModelMap model) {
		return "springAutoWire";
	}
	@RequestMapping(value = "/springExamples", method = RequestMethod.GET)
	public String getspringExamples(ModelMap model) {
		return "springExamples";
	}
	@RequestMapping(value = "/springDataAccess", method = RequestMethod.GET)
	public String getspringDataAccess(ModelMap model) {
		return "springDataAccess";
	}@RequestMapping(value = "/springWebREST", method = RequestMethod.GET)
	public String getspringWebREST(ModelMap model) {
		return "springWebREST";
	}@RequestMapping(value = "/springDataAccessJDBC", method = RequestMethod.GET)
	public String getspringDataAccessJDBC(ModelMap model) {
		return "springDataAccessJDBC";
	}@RequestMapping(value = "/springDataAccessHibernate", method = RequestMethod.GET)
	public String getspringDataAccessHibernate(ModelMap model) {
		return "springDataAccessHibernate";
	}@RequestMapping(value = "/springDataAccessOXM", method = RequestMethod.GET)
	public String getspringDataAccessOXM(ModelMap model) {
		return "springDataAccessOXM";
	}@RequestMapping(value = "/springWebservlet", method = RequestMethod.GET)
	public String getspringWebservlet(ModelMap model) {
		return "springWebservlet";
	}@RequestMapping(value = "/springWeb", method = RequestMethod.GET)
	public String getspringWeb(ModelMap model) {
		return "springWeb";
	}
	
}

