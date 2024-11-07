<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    
    <style>
        .show {
            display: block;
        }

        .hide {
            display: none; 
        }
    </style>
    
    <script>
        function togglePassword() {
            const x = document.getElementById("password");
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

        window.addEventListener("DOMContentLoaded", () => {
            const formLogin = document.getElementById("kc-form-login");
            const usernameInput = document.getElementById("username");
            const passwordInput = document.getElementById("password");
            const usernameErrMsg = document.getElementById("input-error-username");
            const passwordErrMsg = document.getElementById("input-error-password");
            const errMsg = document.getElementById("input-error");


            formLogin.addEventListener("submit", (event) => {
                if (usernameInput.value === "" || passwordInput.value === "") {
                    event.preventDefault();
                    if (errMsg !== null) {
                        errMsg.style.display = "none";
                    }
                    usernameErrMsg.classList.add("show");
                    passwordErrMsg.classList.add("show");
                    usernameErrMsg.classList.remove("hide");
                    passwordErrMsg.classList.remove("hide");
                    if (usernameInput.value !== "") {
                        usernameErrMsg.classList.add("hide");
                        usernameErrMsg.classList.remove("show");
                    }
                    if (passwordInput.value !== "") {
                        passwordErrMsg.classList.add("hide");
                        passwordErrMsg.classList.remove("show");
                    }
                }
                else {
                    usernameErrMsg.classList.add("hide");
                    passwordErrMsg.classList.add("hide");
                    usernameErrMsg.classList.remove("show");
                    passwordErrMsg.classList.remove("show");
                }
            })
        })
        
    </script>
    
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <div id="kc-form">
          <div id="kc-form-wrapper">
            <#if realm.password>
                <form id="kc-form-login"  action="${url.loginAction}" method="post">
                    <#if !usernameHidden??>
                        <div class="${properties.kcFormGroupClass!}">
                            <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                            <input tabindex="2" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="username"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />
                            

                            <#if messagesPerField.existsError('username','password')>
                                <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                </span>
                            </#if>

                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!} hide" aria-live="polite">
                                ${msg("usernameRequired")}
                            </span>

                        </div>
                    </#if>

                    <div class="${properties.kcFormGroupClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>

                        <div class="${properties.kcInputGroup!}">
                            <input tabindex="3" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="current-password"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />
                            

                            <button class="${properties.kcFormPasswordVisibilityButtonClass!}" type="button" aria-label="${msg("showPassword")}" onclick="togglePassword()"
                                    aria-controls="password" tabindex="4"
                                    data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                    data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                <#-- <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i> -->
                                
                                
                                <#-- <svg  width="22" height="18" viewBox="0 0 22 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M1 1.27L2.28 0L19 16.72L17.73 18L14.65 14.92C13.5 15.3 12.28 15.5 11 15.5C6 15.5 1.73 12.39 0 8C0.69 6.24 1.79 4.69 3.19 3.46L1 1.27ZM11 5C11.7956 5 12.5587 5.31607 13.1213 5.87868C13.6839 6.44129 14 7.20435 14 8C14.0005 8.34057 13.943 8.67873 13.83 9L10 5.17C10.3213 5.05698 10.6594 4.99949 11 5ZM11 0.5C16 0.5 20.27 3.61 22 8C21.1834 10.0729 19.7966 11.8723 18 13.19L16.58 11.76C17.9629 10.8034 19.0783 9.5091 19.82 8C19.0117 6.34987 17.7565 4.95963 16.1974 3.98735C14.6382 3.01508 12.8375 2.49976 11 2.5C9.91 2.5 8.84 2.68 7.84 3L6.3 1.47C7.74 0.85 9.33 0.5 11 0.5ZM2.18 8C2.98835 9.65014 4.24345 11.0404 5.80264 12.0126C7.36182 12.9849 9.16251 13.5002 11 13.5C11.69 13.5 12.37 13.43 13 13.29L10.72 11C10.0242 10.9254 9.37482 10.6149 8.87997 10.12C8.38512 9.62518 8.07458 8.97584 8 8.28L4.6 4.87C3.61 5.72 2.78 6.78 2.18 8Z" fill="#848484"/>
                                </svg> -->
                                
                                <img id="img-password" src="${url.resourcesPath}/img/eye-off.png"/>


                            </button>
                        </div>
                        <span id="input-error-password" class="${properties.kcInputErrorMessageClass!} hide" aria-live="polite">
                                ${msg("passwordRequired")}
                        </span>

                        <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                            <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>

                    </div>

                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options">
                            <#if realm.rememberMe && !usernameHidden??>
                                <div class="checkbox">
                                    <label>
                                        <#if login.rememberMe??>
                                            <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                        <#else>
                                            <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                        </#if>
                                    </label>
                                </div>
                            </#if>
                            </div>
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="6" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>

                      </div>

                      <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                          <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                          <input tabindex="7" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                      </div>
                </form>
            </#if>
            </div>
        </div>
        
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="8"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    <#elseif section = "socialProviders" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h2>${msg("identity-provider-login-label")}</h2>

                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li class="social-login">
                            <a id="social-${p.alias}" class="social-link"
                                    type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
    <div class="bg-img-contain">
        <img src="${url.resourcesPath}/img/background_img.png" alt="bg-img" class="bg-img"/>
    </div>
    

</@layout.registrationLayout>
