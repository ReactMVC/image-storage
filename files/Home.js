import * as React from 'react';
import Box from '@mui/material/Box';
import BottomNavigation from '@mui/material/BottomNavigation';
import BottomNavigationAction from '@mui/material/BottomNavigationAction';
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import FileCopy from '@mui/icons-material/FileCopy';
import HomeIcon from '@mui/icons-material/Home';
import Settings from '@mui/icons-material/Settings';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardHeader from '@mui/material/CardHeader';
import Button from '@mui/material/Button';
import Input from '@mui/material/Input';
import axios from 'axios';

export default function Home() {
  const [value, setValue] = React.useState(0);
  const [uploadProgress, setUploadProgress] = React.useState(0);

  React.useEffect(() => {
    document.title = 'Osta - Home';
  }, []);

  const handleFileChange = async (event) => {
    const file = event.target.files[0];
    const formData = new FormData();
    formData.append('file', file);

    try {
      const response = await axios.post('http://localhost:4000/upload', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
        onUploadProgress: (progressEvent) => {
          const percentCompleted = Math.round((progressEvent.loaded * 100) / progressEvent.total);
          setUploadProgress(percentCompleted);
        },
      });

      console.log(response.data.download_url);
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <>
      <AppBar position="static">
        <Container maxWidth="xl">
          <Toolbar disableGutters>
            <FileCopy sx={{ display: { xs: 'none', md: 'flex' }, mr: 1 }} />
            <Typography
              variant="h6"
              noWrap
              sx={{
                mr: 2,
                display: { xs: 'none', md: 'flex' },
                fontFamily: 'monospace',
                fontWeight: 700,
                letterSpacing: '.3rem',
                color: 'inherit',
                textDecoration: 'none',
              }}
            >
              Osta (Desktop)
            </Typography>
            <FileCopy sx={{ display: { xs: 'flex', md: 'none' }, mr: 1 }} />
            <Typography
              variant="h5"
              noWrap
              sx={{
                mr: 2,
                display: { xs: 'flex', md: 'none' },
                flexGrow: 1,
                fontFamily: 'monospace',
                fontWeight: 700,
                letterSpacing: '.3rem',
                color: 'inherit',
                textDecoration: 'none',
              }}
            >
              Osta
            </Typography>
          </Toolbar>
        </Container>
      </AppBar>
      {/* file card */}
      <Container maxWidth="sm" sx={{ marginTop: '2rem' }}>
        <Card>
          <CardHeader 
            title="Osta Client" 
            subheader="Free file upload app" 
            titleTypographyProps={{ align: 'center' }} 
            subheaderTypographyProps={{ align: 'center' }}
          />
          <CardContent sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
            <Input type="file" sx={{ display: 'none' }} id="raised-button-file" onChange={handleFileChange} />
            <label htmlFor="raised-button-file">
              <Button variant="contained" component="span">
                Select File
              </Button>
            </label>
            {uploadProgress > 0 && <p>Upload progress: {uploadProgress}%</p>}
          </CardContent>
        </Card>
      </Container>
      <Box sx={{ 
        width: '100%', 
        position: 'fixed', 
        bottom: 0, 
        left: 0 
      }}>
        <BottomNavigation
          showLabels
          value={value}
          onChange={(event, newValue) => {
            setValue(newValue);
          }}
        >
          <BottomNavigationAction label="Home" icon={<HomeIcon />} />
          <BottomNavigationAction label="Settings" icon={<Settings />} />
        </BottomNavigation>
      </Box>
    </>
  );
}