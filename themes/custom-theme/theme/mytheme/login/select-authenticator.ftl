<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false; section>

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
                align-items: center;
                flex-direction: column;
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
        }

        .help-text-contain {
            display: flex;
            margin-top: 10px;
            justify-content: center;
        }

        @media screen and (max-width: 768px) {
            .help-text-contain {
                display: none;
            }

            .help-text-contain-mobile {
                display: flex;
                margin-top: 10px;
                justify-content: center;
            }
        }

        .btn-login-method {
            width: 402px;
            height: 113px;
            border: 1.5px solid #CECECE;
            border-radius: 15px;
            margin-bottom: 17px;
            padding: 27px 25px;
        }

        @media screen and (max-width: 768px) {
            .btn-login-method {
                width: 328px;
                height: 90px;
                border: 1.5px solid #CECECE;
                border-radius: 15px;
                padding: 20px 15px;
            }
        }

        .titleOTP {
            font-weight: 500;
            font-size: 16px;
            line-height: 20px;
            color: #000;
        }

        help-text-OTP {
            font-weight: 600;
            font-size: 15px;
            line-height: 24px;
            letter-spacing: 0.3px;
            color: #868686;
        }
    </style>

    <#if section = "header" || section = "show-username">
        <#if section = "header">
            ${msg("loginChooseAuthenticator")}
        </#if>
    <#elseif section = "form">
        <form id="kc-select-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcSelectAuthListClass!}">
                <#list auth.authenticationSelections as authenticationSelection>
                    <button class="${properties.kcSelectAuthListItemClass!} btn-login-method" type="submit" name="authenticationExecution" value="${authenticationSelection.authExecId}">

                        <#if authenticationSelection?index == 0>
                            <div class="${properties.kcSelectAuthListItemIconClass!}" style="margin: 0 13px 0 0">
                                <?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo, www.svgrepo.com, Generator: SVG Repo Mixer Tools -->
                                <svg xmlns="http://www.w3.org/2000/svg" fill="#000000" width="29" height="23" viewBox="0 0 24 24" style="align-self: center">
                                    <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/>
                                </svg>

                            </div>
                            <div class="${properties.kcSelectAuthListItemBodyClass!}" style="justify-content: center">
                                <div class="${properties.kcSelectAuthListItemHeadingClass!} titleOTP">
                                    ${msg("emailOTPTitle")}
                                </div>
                                <div class="${properties.kcSelectAuthListItemDescriptionClass!} help-text-OTP">
                                    ${msg("emailOTPHelpText")}
                                </div>
                            </div>
                        <#else>
                            <div class="${properties.kcSelectAuthListItemIconClass!}" style="margin: 0 13px 0 0">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="align-self: center">
                                    <path d="M21.0375 16.075L17.8626 15.7125C17.4892 15.6686 17.1108 15.7099 16.7557 15.8333C16.4007 15.9567 16.0782 16.159 15.8126 16.425L13.5126 18.725C9.96404 16.9202 7.07978 14.036 5.27505 10.4875L7.58755 8.17495C8.12505 7.63745 8.38755 6.88745 8.30005 6.12495L7.93755 2.97495C7.86668 2.36517 7.57404 1.80275 7.11535 1.39476C6.65665 0.986776 6.06394 0.761723 5.45005 0.762453H3.28755C1.87505 0.762453 0.700051 1.93745 0.787551 3.34995C1.45005 14.025 9.98755 22.55 20.6501 23.2125C22.0626 23.3 23.2375 22.125 23.2375 20.7125V18.55C23.25 17.2875 22.3 16.225 21.0375 16.075Z" fill="black"/>
                                </svg>
                            </div>
                            <div class="${properties.kcSelectAuthListItemBodyClass!}" style="justify-content: center">
                                <div class="${properties.kcSelectAuthListItemHeadingClass!} titleOTP">
                                    ${msg("smsOTPTitle")}
                                </div>
                                <div class="${properties.kcSelectAuthListItemDescriptionClass!} help-text-OTP">
                                    ${msg("smsOTPHelpText")}
                                </div>
                            </div>
                        </#if>

                        <#-- <div class="${properties.kcSelectAuthListItemIconClass!}">
                            <i class="${properties['${authenticationSelection.iconCssClass}']!authenticationSelection.iconCssClass} ${properties.kcSelectAuthListItemIconPropertyClass!}"></i>
                        </div>
                        <div class="${properties.kcSelectAuthListItemBodyClass!}">
                            <div class="${properties.kcSelectAuthListItemHeadingClass!}">
                                ${msg('${authenticationSelection.displayName}')}
                            </div>
                            <div class="${properties.kcSelectAuthListItemDescriptionClass!}">
                                ${msg('${authenticationSelection.helpText}')}
                            </div>
                        </div> -->

                        <div class="${properties.kcSelectAuthListItemFillClass!}"></div>
                        <#-- <div class="${properties.kcSelectAuthListItemArrowClass!}">
                            <i class="${properties.kcSelectAuthListItemArrowIconClass!}"></i>
                        </div> -->
                    </button>
                </#list>
            </div>
        </form>

    </#if>
</@layout.registrationLayout>

