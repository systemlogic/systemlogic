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
}

