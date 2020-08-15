<#import "partials/main.ftlh" as main />

<@main.renderWith>
    <div class="third-block container">
        <h3>Recent Work Done on <span class="words">JOB BOARD</span></h3>
        <#if cafes??>
            <#list cafes as cafe>
                <div class="row">
<#--                    <img src="${cafe.images.get(0).path}" class="card-img-top" alt="...">-->
                    <p>${cafe.images.get(0).path}</p>
                    <div class="card-body">
                        <a href="#" class="btn" style="background-color: #1d9fbd">graphics</a>
                        <h5 class="card-title">${cafe.title}</h5>
                    </div>
                </div>
            </#list>
        </#if>
<#--            <div class="card mb-3">-->
<#--            <div class="card mb-3">-->
<#--                <img src="images/pic-2.jpg" class="card-img-top" alt="...">-->
<#--                <div class="card-body">-->
<#--                    <a href="#" class="btn" style="background-color: #44bd1d">graphics</a>-->
<#--                    <h5 class="card-title">stationary design</h5>-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="card mb-3">-->
<#--                <img src="images/pic-3.jpg" class="card-img-top" alt="...">-->
<#--                <div class="card-body">-->
<#--                    <a href="#" class="btn" style="background-color: #bd1d93">graphics</a>-->
<#--                    <h5 class="card-title">logo design</h5>-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="card mb-3">-->
<#--                <img src="images/pic-4.jpg" class="card-img-top" alt="...">-->
<#--                <div class="card-body">-->
<#--                    <a href="#" class="btn" style="background-color: #ffd401">graphics</a>-->
<#--                    <h5 class="card-title">branding</h5>-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="card">-->
<#--                <img src="images/pic-5.jpg" class="card-img-top" alt="...">-->
<#--                <div class="card-body">-->
<#--                    <a href="#" class="btn" style="background-color: #44bd1d">graphics</a>-->
<#--                    <h5 class="card-title">visiting card design</h5>-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="card">-->
<#--                <img src="images/pic-6.jpg" class="card-img-top" alt="...">-->
<#--                <div class="card-body">-->
<#--                    <a href="#" class="btn" style="background-color: #ffd401">graphics</a>-->
<#--                    <h5 class="card-title">brochure design</h5>-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="card">-->
<#--                <img src="images/pic-7.jpg" class="card-img-top" alt="...">-->
<#--                <div class="card-body">-->
<#--                    <a href="#" class="btn" style="background-color: #1d9fbd">graphics</a>-->
<#--                    <h5 class="card-title">branding</h5>-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="card">-->
<#--                <img src="images/pic-8.jpg" class="card-img-top" alt="...">-->
<#--                <div class="card-body">-->
<#--                    <a href="#" class="btn" style="background-color: #bd1d93">graphics</a>-->
<#--                    <h5 class="card-title">stationary design</h5>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
    </div>

</@main.renderWith>