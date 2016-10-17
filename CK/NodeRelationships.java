mport java.io.*;
import java.util.*;

public class NodeRelationships extends Object implements Serializable {
    private String node;
    private int sequence;
    private Map<String,Set> properties;
    private Map<String,Set> in;
    private Map<String,Set> out;
    private BerkleyServer server;
    private AllocationTemplate allocationTemplate;
    
    public NodeRelationships(String node, int sequence, AllocationTemplate t) {
        this.node = node;
        this.sequence = sequence;
        this.properties= new HashMap();
        this.in= new HashMap();
        this.out= new HashMap();
        this.allocationTemplate = t;
    }

    public String getIDNode() {
        return this.node+"_"+this.sequence;
    }
   
    public void addProperty(String predicate, String obj) {
        Set adj = getProperties().get(predicate);
        if (adj == null) {
            adj = new HashSet();
        }
        adj.add(obj);
        getProperties().put(predicate, adj);
    }    
    
    public void addIn(String predicate, Object o) {
        Set adj = getIn().get(predicate);
        if (adj == null) {
            adj = new HashSet();
        }
        adj.add(o);
        getIn().put(predicate, adj);
    }

    public void addOut(String predicate, Object o) {
        Set adj = getOut().get(predicate);
        if (adj == null) {
            adj = new HashSet();
        }
        adj.add(o);
        getOut().put(predicate, adj);
    }
    
    public String getNode() {
        return node;
    }

    public void setNode(String node) {
        this.node = node;
    }

    public Map<String,Set> getProperties() {
        return properties;
    }

    public void setProperties(Map<String,Set> properties) {
        this.properties = properties;
    }

    public Map<String,Set> getIn() {
        return in;
    }

    public void setIn(Map<String,Set> in) {
        this.in = in;
    }

    public Map<String,Set> getOut() {
        return out;
    }

    public void setOut(Map<String,Set> out) {
        this.out = out;
    }
   
    public AllocationTemplate getAllocationTemplate() {
        return allocationTemplate;
    }

    public void setAllocationTemplate(AllocationTemplate allocationTemplate) {
        this.allocationTemplate = allocationTemplate;
    }

    public int getSequence() {
        return sequence;
    }

    public void setSequence(int sequence) {
        this.sequence = sequence;
    }

    public BerkleyServer getServer() {
        return server;
    }

    public void setServer(BerkleyServer server) {
        this.server = server;
    }   
}
