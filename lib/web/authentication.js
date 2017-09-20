const basicAuth = require('basic-auth');

exports.BasicAuthentication = (req, res, next) => {
  function unauthorized() {
    res.set('WWW-Authenticate', 'Basic realm=Authorization Required');
    return res.send(401);
  }

  const user = basicAuth(req);

  if (!user || !user.name || !user.pass) {
    return unauthorized(res);
  }

  if (user.name === 'elanco' && user.pass === 'elanco123') {
    return next();
  }
  return unauthorized(res);
};
