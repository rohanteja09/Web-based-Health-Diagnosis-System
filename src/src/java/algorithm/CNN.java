/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package algorithm;

import java.util.Collection;
import java.util.LinkedHashMap;

/**
 *
 * @author David-Pc
 */
//CNN Algorithm Processing
public class CNN 
{
    //Assign variable in all attributes 
    private int cp = 0;
    private int trestbps = 0;
    private int chol = 0;
    private int fbs = 0;
    private int restecg = 0;
    private int thalach = 0;
    private int exang = 0;
    private int oldpeak = 0;
    private int slope = 0;
    private int ca = 0;
    private int thal =  0;
    private int num = 0; 
    
    public void chest_pain(Integer cp)
    {
        this.cp=cp;
    }
    public void resting_blood_pressure(Integer trestbps)
    {
        this.trestbps=trestbps;
    }
    public void serum_cholestoral(Integer chol)
    {
        this.chol=chol;
    }
    public void fasting_blood_sugar(Integer fbs)
    {
        this.fbs=fbs;
    }
    public void resting_electrocardiographic_results(Integer restecg)
    {
        this.restecg=restecg;
    }
    public void heart_rate_achieved(Integer thalach)
    {
        this.thalach=thalach;
    }
    public void exercise_induced_angina(Integer exang)
    {
        this.exang=exang;
    }
    public void ST_depression_induced_by_exercise(Integer oldpeak)
    {
        this.oldpeak=oldpeak;
    }
    public void  slope_of_the_peak_exercise(Integer slope)
    {
        this.slope=slope;
    }
    public void number_of_major_vessels(Integer ca)
    {
        this.ca=ca;
    }
    public void thal(Integer thal)
    {
        this.thal=thal;
    }
    public void num(Integer num)
    {
        this.num=num;
    }
    //retrival all attribute claasification prediction
    public String get_chest_pain()
    {
        LinkedHashMap<String,String>cnn=new LinkedHashMap<>();
        cnn.put("0", "Low Level");
        cnn.put("-", "Normal Level");
        cnn.put("1", "High Level");
        cnn.put("2", "High Level");
        cnn.put("3", "High Level");
        cnn.put("4", "High Level");
        Collection<String> Cnnkey=cnn.keySet();
        
        String risk_status="";
                
        for(String Temp:Cnnkey)
        {
            String value=""+cp;
            if(value.equalsIgnoreCase(Temp))
            {
                risk_status=cnn.get(Temp);
            }
        }
        return risk_status;
    }
    public String get_resting_blood_pressure()
    {
        int cnn[]=new int[2];
        cnn[0]=120;
        String risk_status="";
        if(trestbps<=cnn[0])
        {
            risk_status="Low Level";
        }
        else if (trestbps>cnn[0])
        {
            risk_status="High Level";
        }
        return risk_status;
    }
    public String get_serum_cholestoral()
    {
        int code[]=new int[2];
        code[0]=160;
        code[1]=240;
        String risk_status="";
        if(chol<code[0])
        {
            risk_status="Normal Level";
        }
        else if(chol>=code[0]&&chol<code[1])
        {
            risk_status="Low Level";
        }
        else if (chol>code[1])
        {
            risk_status="High Level";
        }
        return risk_status;
    }
    public String get_fasting_blood_sugar()
    {
       LinkedHashMap<String,String>cnn=new LinkedHashMap<>();
       cnn.put("0", "Low Level");
       cnn.put("-", "Normal Level");
       cnn.put("1", "High Level");
       Collection<String> Cnnkey=cnn.keySet();
       String risk_status="";
       for(String Temp:Cnnkey)
       {
           String value=""+fbs;
           if(value.equalsIgnoreCase(Temp))
           {
               risk_status=cnn.get(Temp);
           }
        }
        return risk_status;
    }
    public String get_resting_electrocardiographic_results()
    {
        LinkedHashMap<String,String>cnn=new LinkedHashMap<>();
        cnn.put("-", "Low Level");
        cnn.put("0", "Normal Level");
        cnn.put("1", "High Level");
        cnn.put("2", "High Level");
        Collection<String> Cnnkey=cnn.keySet();
        String risk_status="";
        for(String Temp:Cnnkey)
        {
            String value=""+restecg;
            if(value.equalsIgnoreCase(Temp))
            {
                risk_status=cnn.get(Temp);
            }
        }
        return risk_status;
    }
    public String get_heart_rate_achieved()
    {
        int code[]=new int[2];
        code[0]=100;
        code[1]=190;
        String risk_status="";
        if(thalach<code[0])
        {
            risk_status="Low Level";
        }
        else if(thalach>=code[0]&&thalach<code[1])
        {
            risk_status="Normal Level";
        }
        else if (thalach>code[1])
        {
            risk_status="High Level";
        }
        return risk_status;
    }
    public String get_exercise_induced_angina()
    {
        LinkedHashMap<String,String>cnn=new LinkedHashMap<>();
        cnn.put("0", "Low Level");
        cnn.put("-", "Normal Level");
        cnn.put("1", "High Level");
        Collection<String> Cnnkey=cnn.keySet();
        String risk_status="";
        for(String Temp:Cnnkey)
        {
            String value=""+exang;
            if(value.equalsIgnoreCase(Temp))
            {
                risk_status=cnn.get(Temp);
            }
        }
        return risk_status;
    }
    public String get_ST_depression_induced_by_exercise()
    {
        int code[]=new int[2];
        code[0]=0;
        String risk_status="";
        if(oldpeak<code[0])
        {
            risk_status="Low Level";
        }
        else if(oldpeak>code[0])
        {
            risk_status="High Level";
        }
        else if (oldpeak==code[0])
        {
            risk_status="Normal Level";
        }
        return risk_status;
    }
    public String get_slope_of_the_peak_exercise()
    {
        LinkedHashMap<String,String>cnn=new LinkedHashMap<>();
        cnn.put("-", "Low Level");
        cnn.put("0", "Normal Level");
        cnn.put("1", "High Level");
        cnn.put("2", "High Level");
        cnn.put("3", "High Level");
        Collection<String> Cnnkey=cnn.keySet();
        String risk_status="";
        for(String Temp:Cnnkey)
        {
            String value=""+slope;
            if(value.equalsIgnoreCase(Temp))
            {
                risk_status=cnn.get(Temp);
            }
        }
        return risk_status;
    }
    
    public String get_number_of_major_vessels()
    {
        LinkedHashMap<String,String>cnn=new LinkedHashMap<>();
        cnn.put("-", "Low Level");
        cnn.put("-", "Normal Level");
        cnn.put("0", "High Level");
        cnn.put("1", "High Level");
        cnn.put("2", "High Level");
        cnn.put("3", "High Level");
        Collection<String> Cnnkey=cnn.keySet();
        String risk_status="";
        for(String Temp:Cnnkey)
        {
            String value=""+ca;
            if(value.equalsIgnoreCase(Temp))
            {
                risk_status=cnn.get(Temp);
            }
        }
        return risk_status;
    }
    public String get_thal()
    {
        LinkedHashMap<String,String>cnn=new LinkedHashMap<>();
        cnn.put("3", "Low Level");
        cnn.put("-", "Normal Level");
        cnn.put("6", "High Level");
        cnn.put("7", "High Level");
        Collection<String> Cnnkey=cnn.keySet();
        String risk_status="";
        for(String Temp:Cnnkey)
        {
            String value=""+thal;
            if(value.equalsIgnoreCase(Temp))
            {
                risk_status=cnn.get(Temp);
            }
        }
        return risk_status;
    }
    
    public String get_num()
    {
        LinkedHashMap<String,String>cnn=new LinkedHashMap<>();
        cnn.put("0", "Low Level");
        cnn.put("-", "Normal Level");
        cnn.put("1", "High Level");
        Collection<String> Cnnkey=cnn.keySet();
        String risk_status="";
        for(String Temp:Cnnkey)
        {
            String value=""+num;
            if(value.equalsIgnoreCase(Temp))
            {
                risk_status=cnn.get(Temp);
            }
        }
        return risk_status;
    }
    
    //This is main method
    public static void main(String args[])
    {
        CNN c=new CNN();
        System.out.println("Set User Datasets Value");
        c.chest_pain(0);       
        c.resting_blood_pressure(121);
        c.serum_cholestoral(150);
        c.fasting_blood_sugar(1);
        c.resting_electrocardiographic_results(0);
        c.heart_rate_achieved(101);
        c.exercise_induced_angina(0);
        c.ST_depression_induced_by_exercise(0);
        c.slope_of_the_peak_exercise(1);
        c.number_of_major_vessels(3);//ca
        c.thal(3);
        c.num(0);
        
        System.out.println("Display Users Datasets Value Result");
        String cp=c.get_chest_pain();
        String rbp=c.get_resting_blood_pressure();
        String sc=c.get_serum_cholestoral();
        String fbs=c.get_fasting_blood_sugar();
        String rer=c.get_resting_electrocardiographic_results();
        String hra=c.get_heart_rate_achieved();
        String eia=c.get_exercise_induced_angina();
        String sibye=c.get_ST_depression_induced_by_exercise();
        String sotpe=c.get_slope_of_the_peak_exercise();
        String nomv=c.get_number_of_major_vessels();
        String thal=c.get_thal();
        String num=c.get_num();
        
        System.out.println(cp);
        System.out.println(rbp);
        System.out.println(sc);
        System.out.println(fbs);
        System.out.println(rer);
        System.out.println(hra);
        System.out.println(eia);
        System.out.println(sibye);
        System.out.println(sotpe);
        System.out.println(nomv);
        System.out.println(thal);
        System.out.println(num);
    }
}
