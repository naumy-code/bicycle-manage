package lenseter;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class OnLineListener
 *
 */
@WebListener
public class OnLineListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
	int  onlineCount;
	
    public OnLineListener() {
        // TODO Auto-generated constructor stub
    	onlineCount=0;
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	onlineCount++;
    	arg0.getSession().getServletContext().setAttribute("online",onlineCount);
    	 
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    	onlineCount--;
    	
    }
	
}
