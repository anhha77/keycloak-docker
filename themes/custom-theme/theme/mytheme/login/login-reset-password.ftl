<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    
    <style>

        @media screen and (max-width: 768px) {
            .login-pf body {
                background-image: none;
            }
        }

        .image-contain {
            display: none;
        }

        .login-pf-page {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card-pf {
            left: auto;
            border-radius: 5px;
        }

        .login-pf-page .card-pf {
            max-width: 550px;
            min-height: auto;
        }

        @media screen and (max-width: 768px) {
            .login-pf-page .card-pf {
                position: absolute;
                top: 30px;
                box-shadow: none;
            }
        }

        .nav-contain {
            display: flex;
            justify-content: space-between;
            background-color: #fff;
            margin-bottom: 20px;
        }

        @media screen and (max-width: 768px) {
            .nav-contain {
                display: none;
            }
        }

        .button-contain-nav {
            display: flex;
            justify-content: space-between;
            min-width: 375px;
            align-items: center;
            margin-right: 63px;
        }

        .nav-text {
            font-size: 16px;
            font-weight: 400;
            line-height: 20.08px;
            color: #434343;
            margin: 0;
        }

        #login-redirect {
            display: flex;
            border-radius: 5px;
            background-color: #DEE3FF;
            color: #605FFF;
            padding: 20px 40px;
            text-decoration: none;
        }

        #login-redirect:hover {
            filter: brightness(90%);
        }

        .logo-img {
            margin-left: 64px;
        }

        #kc-page-title {
            text-align: center;
        }

        @media screen and (max-width: 768px) {
            #kc-page-title {
                display: none;
            }
        }

        @media screen and (max-width: 768px) {
            .nav-contain-mobile {
                display: flex;
                flex-wrap: wrap;
                padding: 20px;
                justify-content: center;
            }

            #nav-mobile-title {
                margin: 0;
                font-size: 18px;
                font-weight: 500;
                line-height: 22.59px;
                position: absolute;
                z-index: -1;
                width: 100%;
                display: flex;
                justify-content: center;
            }

            #nav-link-contain-mobile {
                display: flex;
                justify-content: flex-start;
                position: relative;
                width: 260px;
            }

            #login-redirect-mobile {
                display: flex;
                align-items: center;
                margin-right: auto;
            }

            #login-redirect-mobile > svg {
                
            }
        }

        #kc-info-wrapper {
            display: none;
        }

        .show {
            display: block;
        }

        .hide {
            display: none;
        }
    </style>

    <script>
        window.addEventListener("DOMContentLoaded", () => {
            const usernameInput = document.getElementById("username");
            const formSubmit = document.getElementById("kc-reset-password-form");
            const errMsg = document.getElementById("input-error-username");

            formSubmit.addEventListener("submit", (event) => {
                if (usernameInput.value === "") {
                    event.preventDefault();
                    errMsg.classList.add("show");
                    errMsg.classList.remove("hide");
                }
                else {
                    errMsg.classList.remove("show");
                    errMsg.classList.add("hide");
                }
            })
        })
    </script>
    
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                    <#-- <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if> --> 
                    <span id="input-error-username" class="${properties.kcInputErrorMessageClass!} hide" aria-live="polite">
                       ${msg("missingUsernameMessage")}            
                    </span>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <#-- <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a id="login-redirect" href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div> -->
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>

                
            </div>
        </form>
        
    <#elseif section = "info" >
        <#if realm.duplicateEmailsAllowed>
            ${msg("emailInstructionUsername")}
        <#else>
            ${msg("emailInstruction")}
        </#if>
    </#if>
</@layout.registrationLayout>
