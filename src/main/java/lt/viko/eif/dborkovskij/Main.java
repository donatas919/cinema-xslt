package lt.viko.eif.dborkovskij;

public class Main {
    public static void main(String[] args) {
        try {
            XslTransformer.transformToHTML(
                    "src/main/resources/cinema.xml",
                    "src/main/resources/html/cinema.xsl",
                    "src/main/resources/html/cinema.html");

            XslTransformer.transformToPdf("src/main/resources/cinema.xml",
                    "src/main/resources/pdf/cinema.xsl",
                    "src/main/resources/pdf/cinema.pdf");
        }
        catch (Exception e) {
            System.out.println("Transformation error: " + e.getMessage());
        }
    }

}
