from langchain_community.chat_models import ChatOpenAI
from langchain_core.prompts import PromptTemplate
from langchain_core.output_parsers import StrOutputParser

_prompt = PromptTemplate.from_template("""Here is the issue {issue}.
                                       Here is addidtion information {additional_info}.
                                       Please explain the issue in detail. 
                                       max 100 words.""")

_model = ChatOpenAI(model="gpt-4-1106-preview",
                    temperature=0)

# if you update this, you MUST also update ../pyproject.toml
# with the new `tool.langserve.export_attr`
chain = _prompt | _model | StrOutputParser()
