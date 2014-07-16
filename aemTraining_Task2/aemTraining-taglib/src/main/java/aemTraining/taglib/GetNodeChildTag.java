package aemTraining.taglib;

import java.io.IOException;
import javax.jcr.Node;
import javax.jcr.NodeIterator;
import javax.jcr.RepositoryException;
import org.apache.sling.api.SlingHttpServletRequest;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.TagSupport;

	public class GetNodeChildTag  extends TagSupport implements DynamicAttributes {

		
		private static final long serialVersionUID = 1L;
		
		private Map<String, Object> inputMap = new LinkedHashMap<String, Object>();
		
		
		
		
		@Override
	    public int doStartTag() throws JspException {
			 Map<String, Object> outputMap = new LinkedHashMap<String, Object>();
			try {
				
				for ( String name : inputMap.keySet()){
							
					Node eachNode = ((SlingHttpServletRequest)pageContext.getRequest()).getResourceResolver() .getResource((String)inputMap.get( name )).adaptTo(Node.class);
					
					NodeIterator it = eachNode.getNodes();	
					
					if(it.hasNext()){
						//skip firs jcr: node
						it.nextNode();
					}
					while (it.hasNext()){ 
					   Node node = it.nextNode();
					  
					   outputMap.put(node.getName(), node.getPath());
							   
					}
					
					pageContext.setAttribute(name, outputMap );

				}
			} catch (RepositoryException e) {
			
				e.printStackTrace();
			} 
			
			return SKIP_BODY;
			
		}

		
	public void setDynamicAttribute(String arg0, String name, Object value)
			throws JspException {
			
		inputMap.put(name, value);
	}
	
}