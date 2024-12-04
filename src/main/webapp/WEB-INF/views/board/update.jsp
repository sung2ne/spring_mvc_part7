<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/top.jsp" />

<div class="container">
    <!-- 메시지 -->
    <jsp:include page="../common/message.jsp" />
    <!--// 메시지 -->

    <h1 class="text-center my-4">게시글 수정</h1>

    <!-- 게시글 수정 -->
    <div class="card">
        <div class="card-body">
            <form id="updateForm" action="/board/${boardVo.seq}/update" method="POST" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" required value="${boardVo.title}">
                </div>
                <div class="mb-3">
                    <label for="content" class="form-label">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력하세요" required>${boardVo.content}</textarea>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="작성자를 입력하세요" required value="${boardVo.username}">
                </div>
                <div class="mb-3">
                    <label for="passwd" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요" required>
                </div>                                 
                <c:if test="${not empty boardVo.fileName}">
                    <div class="mb-3"> 
                        <div class="mb-2">  
                            <span>현재 파일: <a href="/board/${boardVo.seq}/download">${boardVo.originalFileName}</a></span>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="deleteFile" id="deleteFile" value="true">
                            <label class="form-check-label text-danger" for="deleteFile">
                                파일 삭제
                            </label>
                        </div>
                    </div>
                </c:if>
                <div class="mb-3">
                    <label class="form-label">첨부 파일</label>
                    <input type="file" class="form-control" id="uploadFile" name="uploadFile">
                    <small class="form-text text-muted">새 파일을 선택하면 기존 파일은 자동으로 삭제됩니다.</small>
                </div>
                <button type="submit" class="btn btn-primary">수정하기</button>
                <a href="/board/${boardVo.seq}" class="btn btn-secondary">취소</a>
            </form>
        </div>
    </div>
    <!--// 게시글 수정 -->

</div>

<!-- 스크립트 -->
<jsp:include page="../common/script.jsp" />
<!--// 스크립트 -->

<script>
    $(document).ready(function() {
        // TinyMCE 초기화
        tinymce.init({
            selector: '#content',
        });

        // 게시글 폼 검증
        $('#updateForm').validate({
            rules: {
                title: {
                    required: true,
                    minlength: 2,
                    maxlength: 100
                },
                content: {
                    required: true,
                    minlength: 2,
                    maxlength: 1000
                },
                username: {
                    required: true,
                    minlength: 2,
                    maxlength: 10
                },
                passwd: {
                    required: true,
                    minlength: 8,
                    maxlength: 16
                }
            },
            messages: {
                title: {
                    required: '제목을 입력하세요.',
                    minlength: '제목은 최소 2자 이상 입력하세요.',
                    maxlength: '제목은 최대 100자 이하로 입력하세요.'
                },
                content: {
                    required: '내용을 입력하세요.',
                    minlength: '내용은 최소 2자 이상 입력하세요.',
                    maxlength: '내용은 최대 1000자 이하로 입력하세요.'
                },
                username: {
                    required: '작성자를 입력하세요.',
                    minlength: '작성자는 최소 2자 이상 입력하세요.',
                    maxlength: '작성자는 최대 10자 이하로 입력하세요.'
                },
                passwd: {
                    required: '비밀번호를 입력하세요.',
                    minlength: '비밀번호는 최소 8자 이상 입력하세요.',
                    maxlength: '비밀번호는 최대 16자 이하로 입력하세요.'
                }
            },
            errorClass: 'is-invalid',
            validClass: 'is-valid',
            errorPlacement: function(error, element) {
                error.addClass('invalid-feedback');
                element.closest('.mb-3').append(error);
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>

<jsp:include page="../common/bottom.jsp" />