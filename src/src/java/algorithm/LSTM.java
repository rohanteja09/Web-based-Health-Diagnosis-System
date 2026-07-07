/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package algorithm;

import java.util.ArrayList;
/**
 *
 * @author David-Pc
 */
//CART (Classification And Regression Tree)
public class LSTM 
{
    private String Name=null;
    private String Gender=null;
    private String Age=null;
    
    public void set_decision_tree(String Age,String Gender,String Name)
    {
        this.Age=Age;
        this.Gender=Gender;
        this.Name=Name;
    }
    public String[] get_decision_tree()
    {
        ArrayList<String> al=new ArrayList<>();
        al.add(Age);
        al.add(Gender);
        al.add(Name);
        
        try
        {
            System.out.println("Age Validation");
        }
        catch(Exception ex)
        {
            
        }
        int a=45,mid=65;
        String age_risk="",gender_risk="";
        for(int i=0;i<al.size();i++)
        {
            switch(i)
            {
                case 0:
                {
                    if(isStringInt(al.get(i)))
                    {
                        if(Integer.parseInt(al.get(i))<a)
                        {
                            age_risk="Low Level";
                        }
                        else if ((Integer.parseInt(al.get(i))>a)&&(Integer.parseInt(al.get(i))<mid))
                        {
                            age_risk="Normal Level";
                        }
                        else if((Integer.parseInt(al.get(i))>mid))
                        {
                            age_risk="High Level";
                        }
                    }
                    break;
                }
                case 1:
                {
                    if(isStringInt(al.get(i)))
                    {
                        if(Integer.parseInt(al.get(i))==0)
                        {
                            gender_risk="Low Level";
                        }
                        else if (Integer.parseInt(al.get(i))>1)
                        {
                            gender_risk="Normal Level";
                        }
                        else if (Integer.parseInt(al.get(i))==1)
                        {
                            gender_risk="High Level";
                        }
                    }
                    break;
                }
            }
        }
        String value[]={age_risk,gender_risk};
        return value;
    }
    public boolean isStringInt(String s)
    {
        try
        {
            Integer.parseInt(s);
            return true;
        } 
        catch (NumberFormatException ex)
        {
            System.out.println("This is String variable value");
            return false;
        }
    }
    public static void main(String argsd[])
    {
        System.out.println("This is Main Method");
        LSTM c=new LSTM();
        c.set_decision_tree("40", "0", "David");
        String ar[]=c.get_decision_tree();
        System.out.println(ar[0]);
        System.out.println(ar[1]);
    }
}
