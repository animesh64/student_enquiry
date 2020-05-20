/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package studbean;

/**
 *
 * @author Animesh Chourasia
 */
public class ValidationBean implements java.io.Serializable {
    String msg="";
    public boolean isAlpha(String text){
        return text.matches("[a-zA-Z}+");
    }
    public boolean isDigit(String text){
        return text.matches("[0-9]+");
        
    }
    public boolean isEmail(String text){
        return text.matches("[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}");
        
    }
    public boolean validate(String nam, String ag, String eml){
        msg="";
        boolean state=true;
        if(nam==null || nam.trim().length()==0){
            msg=msg+"<br>Name cannot be blank";
            state=false;
        }
        if(nam!=null && nam.trim().length()>0){
            if(!isAlpha(nam)){
                msg = msg+"<br>Name cannot have numbers";
                state=false;
            }
        }
        if(ag==null || ag.trim().length()==0){
            msg=msg+"<br>Age cannot be blank";
            state=false;
        }
        if(ag!=null && ag.trim().length()>0){
            if(!isDigit(ag)){
                msg=msg+"<br> Age can only have numbers";
                state=false;
            }
        }
        if(eml==null || eml.trim().length()==0){
            msg=msg+"<br>Email address cannot be blank";
            state=false;
        }
        if(eml!=null && eml.trim().length()>0){
            if(!isEmail(eml)){
                msg=msg+"<br>Enter a valid email address";
                state=false;
            }
        }
        return state;
    }
    public String getMessage(){
        return msg;
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

