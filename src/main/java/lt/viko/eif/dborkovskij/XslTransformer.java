package lt.viko.eif.dborkovskij;


import org.apache.fop.apps.*;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;

/**
 * This class is for xsl transformations
 */
public class XslTransformer {
    /**
     * Transforms xml file to other format
     * @param xmlFilePath xml file path
     * @param xslFilePath xsl file path
     * @param outputFilePath output file path
     * @throws FileNotFoundException
     * @throws TransformerException
     */
    public static void transformToHTML(String xmlFilePath, String xslFilePath, String outputFilePath) throws FileNotFoundException, TransformerException {
        File xmlFile = new File(xmlFilePath);
        File xslFile = new File(xslFilePath);

        if (!xmlFile.isFile()) throw new FileNotFoundException("Xml file not found");
        if (!xslFile.isFile()) throw new FileNotFoundException("Xsl file not found");

        TransformerFactory factory = TransformerFactory.newInstance();

        Source xslt = new StreamSource(new File(xslFilePath));
        Transformer transformer = factory.newTransformer(xslt);
        Source xmlt = new StreamSource(new File(xmlFilePath));
        transformer.transform(xmlt, new StreamResult(new File(outputFilePath)));
    }

    public static void transformToPdf(String xmlFilePath, String xslFilePath, String outputFilePath) throws IOException, FOPException, TransformerException {
        File xmlFile = new File(xmlFilePath);
        File xslFile = new File(xslFilePath);

        if (!xmlFile.isFile()) throw new FileNotFoundException("Xml file not found");
        if (!xslFile.isFile()) throw new FileNotFoundException("Xsl file not found");

        StreamSource xmlSource = new StreamSource(xmlFile);
        FopFactory fopFactory = FopFactory.newInstance(new File("src/main/resources/pdf").toURI());
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
        OutputStream output = new FileOutputStream(outputFilePath);

        try {
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, output);
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xslFile));
            Result result = new SAXResult(fop.getDefaultHandler());
            transformer.transform(xmlSource, result);
        } finally {
            output.close();
        }
    }
}
