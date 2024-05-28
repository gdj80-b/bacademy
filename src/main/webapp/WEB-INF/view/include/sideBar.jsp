<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
		/* 사이드바 */
		.sidebar-wrapper {
	      	position: fixed;
	      	overflow: auto;
		}
		
		.sidebar {
			height: calc(100vh - 56px);
		}
    </style>
	<title>사이드바</title>
</head>
<body>
	<!-- 사이드바 -->
	<div class="sidenav-wrapper">
		<div class="d-flex flex-column flex-shrink-0 p-3 bg-light sidebar" style="width: 280px;">
			<div class="dropdown">
	      		<a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
	        		<img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
	        		<strong>mdo</strong>
	      		</a>
	    	</div>
	    	<hr>
			<ul class="nav nav-pills flex-column mb-auto">
		      	<li class="nav-item">
		        	<a href="#" class="nav-link active" aria-current="page">
		          		<svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
		          		강의목록
		        	</a>
		      	</li>
		      	<li>
		        	<a href="#" class="nav-link link-dark">
		          		<svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>
		          		직원목록
		        	</a>
		      	</li>
		    </ul>
		</div>
	</div>
</body>
</html>