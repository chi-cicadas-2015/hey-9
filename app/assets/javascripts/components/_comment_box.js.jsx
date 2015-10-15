var CommentBox = React.createClass({

  // getInitialState: function () {
  //   return JSON.parse(this.props.presenter);
  // },

  // handleMessageSubmit: function ( formData, action ) {
  //   $.ajax({
  //     data: formData,
  //     url: action,
  //     type: "POST",
  //     dataType: "json",
  //     success: function ( data ) {
  //       this.setState({ messages: data });
  //     }.bind(this)
  //   });
  // },

  render: function () {
    return (
      <div className="comment-box">
        <CommentList comments={ this.props.comments } />
        <CommentForm form={ this.props.comments.comment_form } />
      </div>
    );
  }
});
