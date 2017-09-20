'use strict';

/* eslint-disable no-undef,no-unused-vars,linebreak-style,comma-dangle,prefer-arrow-callback */

var util = require('util');
var utilities = require('../web/Utilities');

function setHeader() {
  cfClient.getEntries({
    content_type: 'header',
    locale: appLocale
  }).then(function (entries) {
    if (entries.total !== 3) {
      var err = new Error('Error in fetching Home pages entry.');
      err.status = 404;
      next(err);
    }
    var headercontent = new utilities.masterPageHeader();
    var entry = entries.items[0];
    headercontent.HeaderTagLine = entry.fields.paragraph;
    headercontent.HeaderLogo = entry.fields.osurniaLogo.fields.file.url;

    // headercontent.HeaderLogoAlt = entry.fields.headerLogo.fields.description;
    // headercontent.HeaderDontmissoutImage = entry.fields.dontMissOutImage.fields.file.url;
    // headercontent.HeaderDontmissoutImageAlt = entry.fields.dontMissOutImage.fields.description;
    // headercontent.HeaderOfferDetails = entry.fields.osurniaOfferDetails;
    // headercontent.HeaderProductImage = entry.fields.osurniaProductImage.fields.file.url;
    // headercontent.HeaderProductImageAlt = entry.fields.osurniaProductImage.fields.description;
    appServer.locals.headerContent = headercontent;
  });
}
function setFooter() {
  cfClient.getEntries({
    content_type: 'footer',
    locale: appLocale
  }).then(function (entries) {
    if (entries.total !== 1) {
      var err = new Error('Error in fetching Home pages entry.');
      err.status = 404;
      next(err);
    }
    var footercontent = new utilities.masterPageFooter();
    var entry = entries.items[0];

    footercontent.FooterPrivacyStatement = entry.fields.paragraph1;
    // footercontent.FooterPrivacyLinkText = entry.fields.privacyLinkText;
    // footercontent.FooterPrivacyLinkUrl = entry.fields.privacyLinkUrl;
    // footercontent.FooterTouLinkText = entry.fields.termsOfUseLinkText;
    // footercontent.FooterTouLinkUrl = entry.fields.termsOfUseLinkUrl;
    // footercontent.FooterFurtherInfoText = entry.fields.furtherInformationText;
    // footercontent.FooterLogo = entry.fields.footerLogo.fields.file.url;
    // footercontent.FooterLogoAlt = entry.fields.footerLogo.fields.description;
    appServer.locals.footerContent = footercontent;
  });
}
exports.GetGlobalEntriesAppData = function () {
  setHeader();
  setFooter();
};
