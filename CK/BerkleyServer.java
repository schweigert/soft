public class BerkleyServer extends Object {
    private String privateDns;
    private String publicDns;

    public BerkleyServer(String privateD, String publicD) {
        this.privateDns = privateD;
        this.publicDns = publicD;
    }

    public String getPrivateDns() {
        return privateDns;
    }

    public void setPrivateDns(String privateDns) {
        this.privateDns = privateDns;
    }

    public String getPublicDns() {
        return publicDns;
    }

    public void setPublicDns(String publicDns) {
        this.publicDns = publicDns;
    }
    
    public String toString() {
        return "publicDNS: "+this.publicDns+" privateDns: "+this.privateDns;
    }
}
