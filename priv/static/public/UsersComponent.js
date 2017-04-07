/**
 * Created by bmangan on 09/03/2017.
 */
/**
 * MainContainer is a component for holding all other components
 * */
class UsersComponent extends React.Component {
    constructor(props)
    {
        super(props);

        this.state =
        {};
        this.api = new AdminServerApi();
    }

    componentDidMount()
    {
        this.populateUsers();
    }

    populateUsers()
    {
        this.api.getUsers({}, (err, res) =>
        {
            if (err)
            {
                this.props.displayError(err);
            } else
            {
                this.setState({users: res});
            }
        });
    }

    deleteUsers()
    {
        this.api.deleteUsers({}, (err, res) =>
        {
            if (err)
            {
                this.props.displayError(err);
            } else
            {
                this.populateUsers();
            }
        });
    }

    deleteUser(id)
    {
        this.api.deleteUser({id: id}, (err, res) =>
        {
            if (err)
            {
                this.props.displayError(err);
            } else
            {
                this.populateUsers();
            }
        });
    }

    addUser()
    {
        this.api.addUser({
            user: {
                email: this.state.email,
                password: this.state.password,
                name: this.state.name,
                admin: this.state.admin,
                excel_friendly_name: this.state.excel_friendly_name
            }
        }, (err, res)=>
        {
            if (err)
            {
                this.props.displayError(err);
            } else
            {
                this.populateUsers();
            }
        });
    }

    render()
    {
        let usersJsx = this.state.users == null ? "" : this.state.users.map((user)=>
        {
            return <tr key={user.id}>
                <td>id:{user.id}</td>
                <td>Name:{user.name}</td>
                <td>Email:{user.email}</td>
                <td>isAdmin:{user.admin}</td>
                <td><button onClick={()=>{this.deleteUser(user.id)}}> Delete User
                </button></td>
            </tr>;
        });
        return (
            <div className="usersComponent">
                <table className="usersList">{usersJsx}</table>

                <div className="delete"><input className="delete deleteUsers"
                                               onClick={()=>{this.deleteUsers();}}
                                               type="button" value="Delete All"/></div>
                <div className="addUser">
                    <p>Add user</p>
                    <input className="text" onChange={(event) => {this.setState({email:event.target.value})}}
                           type="text" placeholder="email"/>
                    <input className="text" onChange={(event) => {this.setState({name:event.target.value})}}
                           type="text" placeholder="name"/>
                    <label>Is admin:</label><input className="checkBox"
                                                   onChange={(event) => {this.setState({admin:event.target.checked})}}
                                                   type="checkbox"/>
                    <input className="text" onChange={(event) => {this.setState({password:event.target.value})}}
                           type="text" placeholder="password"/>
                    <input className="text"
                           onChange={(event) => {this.setState({excel_friendly_name:event.target.value})}}
                           type="text" placeholder="excel_friendly_name"/>
                    <button onClick={()=>{this.addUser()}}> Add User
                    </button>
                </div>
            </div>
        )
    }


}

window.UsersComponent = UsersComponent;