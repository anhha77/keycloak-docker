<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <script>
        function togglePassword() {
            const x = document.getElementById("password-new");
            const v = document.getElementById("img-password");
            if (x.type === "password") {
                x.type = "text";
                v.src = "${url.resourcesPath}/img/eye.png";
            }
            else {
                x.type = "password";
                v.src = "${url.resourcesPath}/img/eye-off.png";
            }
        }

        function togglePasswordConfirm() {
            const x = document.getElementById("password-confirm");
            const v = document.getElementById("img-password-confirm");
            if (x.type === "password") {
                x.type = "text";
                v.src = "${url.resourcesPath}/img/eye.png";
            }
            else {
                x.type = "password";
                v.src = "${url.resourcesPath}/img/eye-off.png";
            }
        }

        window.addEventListener("DOMContentLoaded", () => {
            const formSubmit = document.getElementById("kc-passwd-update-form");
            const passwordInput = document.getElementById("password-new");
            const confirmPasswordInput = document.getElementById("password-confirm");
            const passErrMsg = document.getElementById("input-error-password");
            const confirmErrMsg = document.getElementById("input-error-password-confirm");
            const unmacthErrMsg = document.getElementById("unmatch-pass");

            formSubmit.addEventListener("submit", (event) => {
                if (passwordInput.value === "" || confirmPasswordInput.value === "") {
                    event.preventDefault();
                    passErrMsg.classList.add("show");
                    confirmErrMsg.classList.add("show");
                    passErrMsg.classList.remove("hide");
                    confirmErrMsg.classList.remove("hide");
                    unmacthErrMsg.classList.add("hide");
                    unmacthErrMsg.classList.remove("show");
                    if (passwordInput.value !== "") {
                        passErrMsg.classList.add("hide");
                        passErrMsg.classList.remove("show");
                    }
                    if (confirmPasswordInput.value !== "") {
                        confirmErrMsg.classList.add("hide");
                        confirmErrMsg.classList.remove("show");
                    }
                }
                else {
                    passErrMsg.classList.add("hide");
                    confirmErrMsg.classList.add("hide");
                    passErrMsg.classList.remove("show");
                    confirmErrMsg.classList.remove("show");
                    if (passwordInput.value !== confirmPasswordInput.value) {
                        event.preventDefault();
                        unmacthErrMsg.classList.add("show");
                        unmacthErrMsg.classList.remove("hide");
                    }
                }
            })
        })
    </script>

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
            top: 20px;
        }

        .card-pf {
            left: auto;
            border-radius: 5px;
        }

        .login-pf-page .card-pf {
            max-width: 550px;
            min-height: auto;
        }

        @media screen and (max-width: 1200px) {
            .login-pf-page .card-pf {
                top: 20px;
            }
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
            display: none;
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
            #login-redirect-mobile > svg {
                display: none;
            }

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
                
            }

            #login-redirect-mobile {
                display: flex;
                align-items: center;
            }

            #login-redirect-mobile > svg {
                margin-left: -30px;
            }
        }

        #kc-info-wrapper {
            display: none;
        }

        .hide {
            display: none;
        }

        .show {
            display: block;
        }
    </style>
    
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-new" class="${properties.kcLabelClass!}">${msg("passwordNew")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="${properties.kcInputGroup!}">
                        <input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!}"
                               autofocus autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        />
                        <button class="${properties.kcFormPasswordVisibilityButtonClass!}" type="button" aria-label="${msg('showPassword')}" onclick="togglePassword()"
                                aria-controls="password-new" 
                                data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                            <#-- <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i> -->
                            <img id="img-password" src="${url.resourcesPath}/img/eye-off.png"/>
                        </button>
                    </div>

                    <#--<#if messagesPerField.existsError('password')>
                        <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if> -->

                    <span id="input-error-password" class="${properties.kcInputErrorMessageClass!} hide" aria-live="polite">
                        ${msg("missingPasswordMessage")}
                    </span>

                    <span id="unmatch-pass" class="${properties.kcInputErrorMessageClass!} hide" aria-live="polite">
                        ${msg("notMatchPasswordMessage")}
                    </span>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="${properties.kcInputGroup!}">
                        <input type="password" id="password-confirm" name="password-confirm"
                               class="${properties.kcInputClass!}"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />
                        <button class="${properties.kcFormPasswordVisibilityButtonClass!}" type="button" aria-label="${msg('showPassword')}" onclick="togglePasswordConfirm()"
                                aria-controls="password-confirm"
                                data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                            <#-- <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i> -->
                            <img id="img-password-confirm" src="${url.resourcesPath}/img/eye-off.png"/>
                        </button>
                    </div>

                    <#-- <#if messagesPerField.existsError('password-confirm')>
                        <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </span>
                    </#if> --> 

                    <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!} hide" aria-live="polite">
                       ${msg("missingConfirmPasswordMessage")}
                    </span>

                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <@passwordCommons.logoutOtherSessions/>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <#if isAppInitiatedAction??>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                        <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                    <#else>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                    </#if>
                </div>
            </div>
        </form>
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
    </#if>
</@layout.registrationLayout>
