from pydantic import BaseModel, Field
from typing import Optional

class BaseResponse(BaseModel):
    success: bool = Field(default=True, description="Indicates if the operation was successful")
    message: Optional[str] = Field(default=None, description="Optional message about the operation") 