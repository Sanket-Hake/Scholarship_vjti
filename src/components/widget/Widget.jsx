import "./widget.css";
import PersonAddAltIcon from '@mui/icons-material/PersonAddAlt';
import GroupsIcon from '@mui/icons-material/Groups';
import PostAddIcon from '@mui/icons-material/PostAdd';
import FormatListBulletedIcon from '@mui/icons-material/FormatListBulleted';

const Widget = ({ type }) => {
  let data;

  switch (type) {
    case "student":
      data = {
        title: "STUDENTS",
        isMoney: false,
        link: "See all students",
        la: '/students',
        icon: (
          <GroupsIcon
            className="icon"
            style={{
              backgroundColor: "#6439ff",
              color: "white",
            }}
          />
        ),
      };
      break;
    case "scholarship":
      data = {
        title: "SCHOLARSHIP",
        isMoney: false,
        link: "View all scholarships",
        la: '/scholarships',
        icon: (
          <FormatListBulletedIcon
            className="icon"
            style={{
              backgroundColor: "#6439ff",
              color: "white",
            }}
          />
        ),
      };
      break;
    case "studentreg":
      data = {
        title: "ADD STUDENT",
        isMoney: false,
        link: "Add student",
        la: '/students/new',
        icon: (
          <PersonAddAltIcon
            className="icon"
            style={{
              backgroundColor: "#6439ff",
              color: "white",
            }}
          />
        ),
      };
      break;
    case "scholarshipreg":
      data = {
        title: "ADD SCHOLARSHIP",
        isMoney: false,
        link: "Add scholarships",
        la: '/scholarships/new',
        icon: (
          <PostAddIcon
            className="icon"
            style={{
              backgroundColor: "#6439ff",
              color: "white",
            }}
          />
        ),
      };
      break;
    default:
      break;
  }

  return (
    <div className="widget">
      <div className="left">
        <span className="title">{data.title}</span>
        <a href={data.la} alt='' style={{ textDecoration: 'none' }}> <span className="link">{data.link}</span> </a>
      </div>


      <div className="right">
        <a href={data.la} alt='' style={{ textDecoration: 'none' }}>{data.icon}</a>
      </div>

    </div>
  );
};

export default Widget;
