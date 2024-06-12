<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false; section>
    <#if section = "header" || section = "show-username">
        <#if section = "header">
            ${msg("loginChooseAuthenticator")}
        </#if>
    <#elseif section = "form">

        <form id="kc-select-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcSelectAuthListClass!}">
                <#list auth.authenticationSelections as authenticationSelection>
                    <button class="${properties.kcSelectAuthListItemClass!}" type="submit" name="authenticationExecution" value="${authenticationSelection.authExecId}" id="${authenticationSelection?index}" ">

                        <div class="${properties.kcSelectAuthListItemIconClass!}">
                            <i class="${properties['${authenticationSelection.iconCssClass}']!authenticationSelection.iconCssClass} ${properties.kcSelectAuthListItemIconPropertyClass!}"></i>
                        </div>
                        <div class="${properties.kcSelectAuthListItemBodyClass!}">
                            <div class="${properties.kcSelectAuthListItemHeadingClass!}">
                                <#-- ${msg('${authenticationSelection.displayName}')} -->
                                
                                <#if authenticationSelection?index == 0>
                                    ${msg("emailOTP")}
                                <#else>
                                    ${msg("smsOTP")}
                                </#if>
                            </div>
                            <div class="${properties.kcSelectAuthListItemDescriptionClass!}">
                                <#-- ${msg('${authenticationSelection.helpText}')} -->

                                <#if authenticationSelection?index == 0>
                                    ${msg("emailDesc")}
                                <#else>
                                    ${msg("smsDesc")}
                                </#if>
                            </div>
                        </div>
                        <div class="${properties.kcSelectAuthListItemFillClass!}"></div>
                        <div class="${properties.kcSelectAuthListItemArrowClass!}">
                            <i class="${properties.kcSelectAuthListItemArrowIconClass!}"></i>
                        </div>
                    </button>
                </#list>
            </div>
        </form>

    </#if>
</@layout.registrationLayout>

