from fastapi import FastAPI
from fastapi.responses import RedirectResponse
from langserve import add_routes

app = FastAPI()


@app.get("/")
async def redirect_root_to_docs():
    return RedirectResponse("/docs")

# Edit this to add the chain you want to add
from issue_explanation.chain import chain as issue_explanation_chain
add_routes(app, issue_explanation_chain, path="/issue-explanation")

#from rag_pinecone import chain as rag_pinecone_chain
#add_routes(app, rag_pinecone_chain, path="/rag-pinecone")

if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)
