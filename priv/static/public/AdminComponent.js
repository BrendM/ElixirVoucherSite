/**
 * Created by bmangan on 09/03/2017.
 */
/**
 * MainContainer is a component for holding all other components
 * */
class AdminComponent extends React.Component {
    constructor(props)
    {
        super(props);

        this.state =
        {};
    }

    componentDidMount()
    {

    }

    render()
    {
        return (
            <div className="adminComponent">
                <UsersComponent displayError={this.props.displayError} />
            </div>
        )
    }


}

window.AdminComponent = AdminComponent;