<#import "partials/main.ftlh" as main />

<@main.renderWith>
    <div class="third-block container">
        <h3>Add new cafe</h3>
        <div class="container mb-5">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <form action="/addCafes" method="post" style="width: 50%; margin-left: auto; margin-right: auto" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Cafe</label>
                    <input name="title" type="text" class="form-control" id="title"  placeholder="Cafe title" required autofocus>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <input name="description" type="text" class="form-control" id="description"  placeholder="Cafe title" required autofocus>

<#--                    <textarea name="description" type="text" class="form-control" id="description"></textarea>-->
                </div>
                <div class="form-group">
                    <label for="image">Image</label>
                    <input name="image" type="file" class="form-control" id="image"  placeholder="Cafe title" required autofocus>

<#--                    <textarea name="image" type="fail" class="form-control" id="image"></textarea>-->
                </div>
                <button type="submit" class="send btn btn-secondary">Add</button>
            </form>
        </div>
    </div>
</@main.renderWith>