from fastapi import APIRouter
from app.models.base import BaseResponse

router = APIRouter(prefix="/health", tags=["Health"])

@router.get("/", response_model=BaseResponse)
async def health_check():
    return BaseResponse(message="Service is healthy") 