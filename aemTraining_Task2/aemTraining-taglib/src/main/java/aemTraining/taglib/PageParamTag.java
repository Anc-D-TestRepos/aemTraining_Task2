package aemTraining.taglib;


import java.util.LinkedHashMap;
import java.util.Map;
import org.apache.sling.api.SlingHttpServletRequest;
import javax.jcr.Node;
import javax.jcr.RepositoryException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.TagSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

    public class PageParamTag extends TagSupport implements DynamicAttributes {


        private static final long serialVersionUID = 1L;
        private static final Logger LOG = LoggerFactory.getLogger(TagSupport.class);
        private Map<String, Object> inputMap = new LinkedHashMap<String, Object>();




        @Override
        public int doStartTag() throws JspException {
             Map<String, Object> outputMap = new LinkedHashMap<String, Object>();


                for ( String key : inputMap.keySet()){
                    try {
                        SlingHttpServletRequest request = (SlingHttpServletRequest)pageContext.getRequest();

                        Node node = request.getResourceResolver().getResource((String) inputMap.get(key)).adaptTo(Node.class);

                        if(node != null){
                            outputMap.put(node.getName(), node.getPath());
                        }
                    } catch (RepositoryException e) {
                        LOG.error("Can't read node "+e.getMessage());
                    }
                    pageContext.setAttribute(key, outputMap );
                }


            return SKIP_BODY;

        }


    public void setDynamicAttribute(String arg0, String name, Object value)
            throws JspException {

        inputMap.put(name, value);
    }

}