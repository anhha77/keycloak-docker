<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('emailCode'); section>
    
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

        #reset-login {
            display: flex;
            border-radius: 5px;
            background-color: #DEE3FF;
            color: #605FFF;
            padding: 20px 40px;
            text-decoration: none;
        }

        #reset-login:hover {
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

        #title-form-action {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        @media screen and (max-width: 768px) {
            #title-form-action {
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

            #reset-redirect-mobile {
                display: flex;
                align-items: center;
            }

            #reset-redirect-mobile > svg {
                margin-left: -30px;
            }
        }

        #input-contain {
            margin: 10px -100px;
        }

        #label-OTP {
            margin-left: 10px;
        }

        @media screen and (max-width: 600px) {
            #label-OTP {
                margin-left: 5px;
            }
        }

        .input {
            width: 61px;
            height: 61px;
            border: 1px solid #979797;
            border-radius: 4px;
            margin: 0 10px;
            text-align: center;
            font-size: 22px;
            line-height: 16px;
            color: #181818;
            cursor: not-allowed;
            pointer-events: none;
        }

        @media screen and (max-width: 768px) {
            .input {
                width: 40px;
                height: 40px;
            }
        }

        @media screen and (max-width: 600px) {
            .input {
                margin: 0 5px;
            }
        } 

        .input:focus {
            border: 1px solid #605FFF;
            outline: none;
        }

        .input:nth-child(1) {
            cursor: pointer;
            pointer-events: all;
        }

        #emailCode {
            display: none;
        }

        #login-OTP:disabled {
            background-color: #BEBEBE;
            color: #fff;
        }

        #instruction-text {
            font-size: 14px;
            font-weight: 400;
            line-height: 17px;
            color: #898989;
        }

        #resend-OTP {
            width: auto;
            height: auto;
            background-color: transparent;
            color: #605FFF;
            padding: 0;
        }

        #input-error-otp-code {
            margin: 0 auto;
        }

    </style>

    <script>
        
        window.addEventListener("DOMContentLoaded", () => {
            const inputOTP = document.getElementById("emailCode");
            const inputs = document.querySelectorAll(".input");
            const buttonLogin = document.getElementById("login-OTP");
            
            let inputCount = 0;
            let finalInput = "";

            const handleBtnLogin = () => {
                if (inputCount !== 6) {
                    buttonLogin.disabled = true;
                }
                else {
                    buttonLogin.disabled = false;
                }
            }

            handleBtnLogin();

            inputs.forEach((element) => {
                element.addEventListener("keyup", (event) => {
                    event.target.value = event.target.value.replace(/[^0-9]/g, "");
                    let {value} = event.target;

                    
                    if (value.length === 1) {
                        if (inputCount <= 5 && event.key != "Backspace") {
                            finalInput += value;
                            inputOTP.value = finalInput;
                            if (inputCount < 5) {
                                event.target.nextElementSibling.focus();
                            }
                        }
                        inputCount += 1;
                    }
                    else if (value.length === 0 && event.key == "Backspace") {
                        finalInput = finalInput.substring(0, finalInput.length - 1);
                        inputOTP.value = finalInput;
                        if (inputCount === 0) {
                            event.target.focus();
                            return false;
                        }
                        if (inputCount === 6) {
                            event.target.value = "";
                            event.target.focus();
                            inputCount -= 1;
                            buttonLogin.disabled = true;
                            return false;
                        }
                        event.target.previousElementSibling.value = "";
                        event.target.previousElementSibling.focus();
                        inputCount -= 1;
                    }
                    else if (value.length > 1) {
                        event.target.value = value.split("")[0];
                    }
                    if (inputCount === 7) inputCount = 6;
                    handleBtnLogin();
                })
            })
        })
        
        
    </script>
    
    
    <#if section="header">
        ${msg("authenticateOTP")}
    <#elseif section="form">
        <div id="input-contain">
            
            <label for="emailCode" id="label-OTP" class="${properties.kcLabelClass!}">${msg("loginOtpOneTime")}</label>
            <div>
                <input class="input" type="text" inputmode="numeric" maxlength="1"/>
                <input class="input" type="text" inputmode="numeric" maxlength="1"/>
                <input class="input" type="text" inputmode="numeric" maxlength="1"/>
                <input class="input" type="text" inputmode="numeric" maxlength="1"/>
                <input class="input" type="text" inputmode="numeric" maxlength="1"/>
                <input class="input" type="text" inputmode="numeric" maxlength="1"/>

            </div>
            
        </div>
        <form id="kc-otp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
            method="post">

            <div class="${properties.kcFormGroupClass!}">
                

                <div class="${properties.kcInputWrapperClass!}">
                    
                    
                    <input id="emailCode" name="emailCode" autocomplete="off" type="text" class="${properties.kcInputClass!}"
                        autofocus/>

                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons">
                    <div class="${properties.kcFormButtonsWrapperClass!} button-contain">
                        <input id="login-OTP" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" type="submit" value="${msg("doLogIn")}" />
                        <div>
                            <span id="instruction-text">${msg("instructionForResendOTP")}</span>
                            <input id="resend-OTP" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="resend" type="submit" value="${msg("resendCode")}"/>
                        </div>
                        
                        <#-- <input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="cancel" type="submit" value="${msg("doCancel")}"/> -->
                    </div>
                </div>
            </div>
        </form>

    </#if>
</@layout.registrationLayout>
