/**
 * Created by bmangan on 15/03/2017.
 */
class AdminServerApi {
    constructor()
    {
    }

    addUser(options, cb)
    {
        this.sendWithJsonParse("PUT", "/admin/user", options, cb);
    }

    getUsers(options, cb){
        this.sendWithJsonParse("GET", "/admin/users", options, cb);
    }

    deleteUsers(options, cb){
        this.sendWithJsonParse("DELETE", "/admin/users", options, null, cb);
    }

    deleteUser(options, cb){
        this.sendWithJsonParse("DELETE", "/admin/user", options, null, cb);
    }

    send(method, endPoint, body, resParser, cb)
    {
        let request = new XMLHttpRequest();
        request.onreadystatechange = () =>
        {
            if (request.readyState === XMLHttpRequest.DONE && request.status === 200)
            {
                // Update configuration data stored in state
                cb(null, resParser == null ? request.responseText : resParser(request.responseText));
            }
            else if (request.readyState === XMLHttpRequest.DONE)
            {
                cb("Request failed! " + request.responseText, null);
            }
        };

        request.open(method, endPoint, true);
        request.setRequestHeader('Content-type', 'application/json');
        //request.setRequestHeader("Authorization", this.b64EncodeUnicode('' + ':' + this.state.password));
        //set this here because IE will freak out if set before open...
        request.timeout = 5000;
        request.send(JSON.stringify(body));
    }

    sendWithJsonParse(method, endPoint, body, cb)
    {
        this.send(method, endPoint, body, JSON.parse, cb)
    }
}

window.AdminServerApi = AdminServerApi;