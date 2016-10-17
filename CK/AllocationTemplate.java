public class AllocationTemplate {
    private String fragTemplate; //t1  t2  t1
    private String fragInstance; //5   5   6  (id product)
    private String patternAllocation; //pa1  pa1  pa2...
    private String patternInstance;   //1    2    3  ...

    public AllocationTemplate(String t, String pa) {
        this.fragTemplate = t;
        this.patternAllocation = pa;
    }

    public boolean equals(AllocationTemplate other) {
        if (this.getFragTemplate().equals(other.getFragTemplate()) && this.patternAllocation.equals(other.getPatternAllocation()))
            return true;
        return false;
    }

    public String getFragTemplate() {
        return fragTemplate;
    }

    public void setFragTemplate(String fragTemplate) {
        this.fragTemplate = fragTemplate;
    }

    public String getPatternAllocation() {
        return patternAllocation;
    }

    public void setPatternAllocation(String patternAllocation) {
        this.patternAllocation = patternAllocation;
    }

    public String toString() {
        return "PA: "+this.patternAllocation+" PA': "+this.patternInstance+" T: "+this.getFragTemplate()+" T': "+this.getFragInstance();
    }

    public String getFragInstance() {
        return fragInstance;
    }

    public String getFragInstanceStr() {
        return this.getFragTemplate()+"_"+this.getFragInstance();
    }

    public void setFragInstance(String fragInstance) {
        this.fragInstance = fragInstance;
    }
    public String getPatternInstance() {
        return patternInstance;
    }

    public String getPatternInstanceStr() {
        return this.getPatternAllocation()+"_"+this.getPatternInstance();
    }

    public String getPatternFragment() { //PA1_2?T2_5
        return this.getPatternInstanceStr()+"?"+this.getFragInstanceStr();
    }

    public void setPatternInstance(String patternInstance) {
        this.patternInstance = patternInstance;
    }
}

