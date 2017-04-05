/**
 * Created by bmangan on 10/14/2016.
 */
/**
 * MainContainer is a component for holding all other components
 * */
class MainContainer extends React.Component {
    constructor(props)
    {
        super(props);

        this.state =
        {
            user: {
                email: "b@t.com",
                name: "b",
                admin: true,
                id: 1
            }
        };
    }

    componentDidMount()
    {

    }

    displayError(err){
        this.setState({error: err})
    }

    render()
    {
        return (
            <div className="mainContainer">
                <AdminComponent displayError={this.displayError}/>

                <p>{this.state.error}</p>
            </div>
        )
    }
}

ReactDOM.render(<MainContainer />, document.getElementById("root"));