import express from "express";
import fs from "fs/promises";

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

async function getDocuments() {
  try {
    const data = await fs.readFile(
      "/workspace/class29-homework/node/week2/document.json",
      "utf-8"
    );
    return JSON.parse(data);
  } catch (error) {
    console.error("Error reading documents:", error);
    throw new Error("Could not load documents.");
  }
}

// Common filtering function for query and fields
function filterDocuments(documents, query, fields) {
  if (query) {
    return documents.filter((doc) =>
      Object.values(doc).some((value) =>
        String(value).toLowerCase().includes(query.toLowerCase())
      )
    );
  }

  if (fields) {
    return documents.filter((doc) =>
      Object.keys(fields).every((field) => doc[field] === fields[field])
    );
  }

  return documents;
}

app.get("/", (req, res) => {
  res.send("This is a search engine");
});

app.get("/search", async (req, res) => {
  const { q } = req.query;
  try {
    const documents = await getDocuments();
    const filteredDocuments = filterDocuments(documents, q, null);
    res.json(filteredDocuments);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

app.get("/document/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const documents = await getDocuments();
    const document = documents.find((doc) => doc.id === parseInt(id));

    if (!document) {
      return res.status(404).send("Document not found");
    }

    res.json(document);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

app.post("/search", async (req, res) => {
  const { q } = req.query;
  const { fields } = req.body;
  try {
    const documents = await getDocuments();

    if (q && fields) {
      return res
        .status(400)
        .json({ message: "Both query and fields cannot be provided" });
    }

    const filteredDocuments = filterDocuments(documents, q, fields);
    res.json(filteredDocuments);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
