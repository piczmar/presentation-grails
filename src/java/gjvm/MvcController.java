package gjvm;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MvcController {
	@RequestMapping(method = RequestMethod.GET, value = "/mvc/test.dispatch")
	public ModelAndView test() {
		return new ModelAndView("/mvc/test/test", new ModelMap("text",
				" - from MVC controller"));
	}

}
